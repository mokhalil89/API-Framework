
package pojo.request;

import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "personal_email"
})
@Generated("jsonschema2pojo")
public class AdditionalInfo {

    @JsonProperty("personal_email")
    private String personalEmail;

    @JsonProperty("personal_email")
    public String getPersonalEmail() {
        return personalEmail;
    }

    @JsonProperty("personal_email")
    public void setPersonalEmail(String personalEmail) {
        this.personalEmail = personalEmail;
    }

}
