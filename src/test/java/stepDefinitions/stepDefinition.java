package stepDefinitions;

import static io.restassured.RestAssured.given;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import static org.junit.Assert.*;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;
import pojo.request.*;
import resources.Utils;

public class stepDefinition extends Utils {

    public static BeneficiaryRequest beneficiaryRequest = null;

    @Then("the API call for {string} returned success with status code {int}")
    public void the_API_call_got_success_with_status_code(String call, int int1) {
        // Write code here that turns the phrase above into concrete actions
        assertEquals(int1, response.getStatusCode());
    }


    @Given("Token with x-client-id {string} and x-api-key {string}")
    public void createTokenCall(String clientId, String apiKey) throws IOException {
        HashMap<String, String> headers = new HashMap<String, String>();
        headers.put("x-client-id", clientId);
        headers.put("x-api-key", apiKey);
        headers.put("Content-Type", "application/json");
        headers.put("Accept", "application/json");
        requestSpecification = given().spec(requestSpecification()).headers(headers).body(new Authentication());
        callHttpRequest("CreateToken", "POST");
    }


    @Then("Verify token API is failing")
    public void verifyTokenAPIIsFailing() {
        Assert.assertNotNull(getJsonPath(response, "code"));
        Assert.assertNotNull(getJsonPath(response, "message"));
        Assert.assertNotNull(getJsonPath(response, "source"));
    }

    @Then("Verify token is created and cache token")
    public void verifyTokenCreated() {
        Assert.assertNotNull(getJsonPath(response, "token"));
        Assert.assertNotNull(getJsonPath(response, "expires_at"));
        token =  getJsonPath(response, "token");
    }

    @When("Then user calls {string} with {string} http request")
    public void thenUserCallsWithHttpRequest(String resource, String method) throws IOException {
        HashMap<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", "Bearer "+token);
        headers.put("Content-Type", "application/json");
        headers.put("Accept", "application/json");
        requestSpecification = given().spec(requestSpecification()).headers(headers).body(beneficiaryRequest);
        callHttpRequest(resource, method);
    }


    @Given("Create Beneficiary Request {string} {string} {string} {string} {string}  {string} {string} {string} {string} {string} {string} {string} {string} {string} {string} {string} {string} {string} {string}")
    public void createBeneficiaryRequest(String value,String nickname, String payerEntityType, String personalEmail,
                                         String paymentMethods,  String city, String countryCode,
                                         String postcode, String state, String streetAddress, String accountCurrency,
                                         String accountName, String accountNumber, String accountRoutingType1,
                                         String bankCountryCode, String bankName, String swiftCode, String companyName, String entityType) {

        System.out.println("Create Beneficiary Request "+value);
        beneficiaryRequest = new BeneficiaryRequest();
        beneficiaryRequest.setNickname(nickname);
        beneficiaryRequest.setPayerEntityType(payerEntityType);
        ArrayList<PaymentMethod> paymentMethods1 = new ArrayList<PaymentMethod>();
        Beneficiary beneficiary = new Beneficiary();
        AdditionalInfo additionalInfo = new AdditionalInfo();
        additionalInfo.setPersonalEmail(personalEmail);
        beneficiary.setAdditionalInfo(additionalInfo);
        beneficiary.setCompanyName(companyName);
        beneficiary.setEntityType(entityType);
        Address address = new Address();
        address.setCity(city);
        address.setCountryCode(countryCode);
        address.setPostcode(postcode);
        address.setState(state);
        address.setStreetAddress(streetAddress);
        beneficiary.setAddress(address);
        BankDetails bankDetails = new BankDetails();
        bankDetails.setAccountCurrency(accountCurrency);
        bankDetails.setAccountName(accountName);
        bankDetails.setAccountNumber(accountNumber);
        bankDetails.setAccountRoutingType1(accountRoutingType1);
        bankDetails.setBankName(bankName);
        bankDetails.setSwiftCode(swiftCode);
        if (!StringUtils.isEmpty(bankCountryCode)) {
            bankDetails.setBankCountryCode(BankCountryCode.valueOf(bankCountryCode));
        }
        if (!StringUtils.isEmpty(paymentMethods)) {
            paymentMethods1.add(PaymentMethod.valueOf(paymentMethods));
            beneficiaryRequest.setPaymentMethods(paymentMethods1);
        }
        beneficiary.setBankDetails(bankDetails);
        beneficiaryRequest.setBeneficiary(beneficiary);
    }

}
