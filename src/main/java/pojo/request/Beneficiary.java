
package pojo.request;

import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "additional_info",
    "address",
    "bank_details",
    "company_name",
    "entity_type"
})
@Generated("jsonschema2pojo")
public class Beneficiary {

    @JsonProperty("additional_info")
    private AdditionalInfo additionalInfo;
    @JsonProperty("address")
    private Address address;
    @JsonProperty("bank_details")
    private BankDetails bankDetails;
    @JsonProperty("company_name")
    private String companyName;
    @JsonProperty("entity_type")
    private String entityType;

    @JsonProperty("additional_info")
    public AdditionalInfo getAdditionalInfo() {
        return additionalInfo;
    }

    @JsonProperty("additional_info")
    public void setAdditionalInfo(AdditionalInfo additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    @JsonProperty("address")
    public Address getAddress() {
        return address;
    }

    @JsonProperty("address")
    public void setAddress(Address address) {
        this.address = address;
    }

    @JsonProperty("bank_details")
    public BankDetails getBankDetails() {
        return bankDetails;
    }

    @JsonProperty("bank_details")
    public void setBankDetails(BankDetails bankDetails) {
        this.bankDetails = bankDetails;
    }

    @JsonProperty("company_name")
    public String getCompanyName() {
        return companyName;
    }

    @JsonProperty("company_name")
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @JsonProperty("entity_type")
    public String getEntityType() {
        return entityType;
    }

    @JsonProperty("entity_type")
    public void setEntityType(String entityType) {
        this.entityType = entityType;
    }

}
