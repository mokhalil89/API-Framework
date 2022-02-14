
package pojo.request;

import java.util.List;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "beneficiary",
    "nickname",
    "payer_entity_type",
    "payment_methods"
})
@Generated("jsonschema2pojo")
public class BeneficiaryRequest {

    @JsonProperty("beneficiary")
    private Beneficiary beneficiary;
    @JsonProperty("nickname")
    private String nickname;
    @JsonProperty("payer_entity_type")
    private String payerEntityType;
    @JsonProperty("payment_methods")
    private List<PaymentMethod> paymentMethods = null;

    @JsonProperty("beneficiary")
    public Beneficiary getBeneficiary() {
        return beneficiary;
    }

    @JsonProperty("beneficiary")
    public void setBeneficiary(Beneficiary beneficiary) {
        this.beneficiary = beneficiary;
    }

    @JsonProperty("nickname")
    public String getNickname() {
        return nickname;
    }

    @JsonProperty("nickname")
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @JsonProperty("payer_entity_type")
    public String getPayerEntityType() {
        return payerEntityType;
    }

    @JsonProperty("payer_entity_type")
    public void setPayerEntityType(String payerEntityType) {
        this.payerEntityType = payerEntityType;
    }

    @JsonProperty("payment_methods")
    public List<PaymentMethod> getPaymentMethods() {
        return paymentMethods;
    }

    @JsonProperty("payment_methods")
    public void setPaymentMethods(List<PaymentMethod> paymentMethods) {
        this.paymentMethods = paymentMethods;
    }

}
