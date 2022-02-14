Feature: Validating API's

  @CreateToken1 @Regression
  Scenario Outline: Verify if token api is failing when invalid arguments are given
    Given Token with x-client-id "<clientId>" and x-api-key "<apiKey>"
    Then Verify token API is failing
    And the API call for "status" returned success with status code 400

    Examples:
      | clientId                      | apiKey                                                                                           |
      | KJbr_Xs5TLmhY03JWSi3NQ-ivalid | 2308e2dd300f6b959b7f4e0a52ba9181186fc92f075f7e64ee9fa0b6b1ada094c39c9a9f39f06693d06b17067f78d4e7 |

  @CreateToken @Regression
  Scenario Outline: Create Token with valid request
    Given Token with x-client-id "<clientId>" and x-api-key "<apiKey>"
    Then Verify token is created and cache token
    And the API call for "status" returned success with status code 201

    Examples:
      | clientId               | apiKey                                                                                           |
      | KJbr_Xs5TLmhY03JWSi3NQ | 2308e2dd300f6b959b7f4e0a52ba9181186fc92f075f7e64ee9fa0b6b1ada094c39c9a9f39f06693d06b17067f78d4e7 |

  @CreateBeneficiary @Regression
  Scenario Outline: Create Beneficiary without method mandatory params
    Given Create Beneficiary Request "without mandatory params" "<nickname>" "<payerEntityType>" "<personalEmail>" "<paymentMethods>"  "<city>" "<countryCode>" "<postcode>" "<state>" "<streetAddress>" "<accountCurrency>" "<accountName>" "<accountNumber>" "<accountRoutingType1>" "<bankCountryCode>" "<bankName>" "<swiftCode>" "<companyName>" "<entityType>"
    Then Then user calls "CreateBeneficiary" with "POST" http request
    And the API call for "status" returned success with status code 400

    Examples:
      | nickname    | payerEntityType | personalEmail        | paymentMethods | city      | countryCode | postcode | state            | streetAddress   | accountCurrency | accountName     | accountNumber               | accountRoutingType1 | bankCountryCode | bankName                                | swiftCode          | companyName    | entityType |
      | Mark        | PERSONAL        | markgotten@gmail.com |                | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Mark gottenburg | 50001121                    | aba                 | US              | JP Morgan Chase Bank                    | CHASUS33           | ABC University | COMPANY    |
      | Sam         | PERSONAL        | sam@gmail.com        | SWIFT          | new york  |             | 98104    | new york         | 412 5th Avenue  | USD             | Sam             | 30000000                    | aba                 | US              | JP Morgan Chase Bank                    | CHASUS33           | ABC University | COMPANY    |
      | Mohamed     | PERSONAL        | Mohamed@gmail.com    | SWIFT          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             |                 | 09134564                    | aba                 | US              | JP Morgan Chase Bank                    | CHASUS33           | ABC University | COMPANY    |
      | Khalil      | PERSONAL        | khalil@gmail.com     | SWIFT          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Khalil          |                             | aba                 | US              | JP Morgan Chase Bank                    | CHASUS33           | ABC University | COMPANY    |
      | Mahmoud     | PERSONAL        | mido@gmail.com       | LOCAL          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Mahmoud Khalil  | 50001121                    | bsb                 | US              | JP Morgan Chase Bank                    | CHASAU33           | ABC University | COMPANY    |
      | Khalil      | PERSONAL        | khalil@gmail.com     | SWIFT          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Mahmoud Khalil  | 50001121                    | aba                 | AU              | JP Morgan Chase Bank                    | 12345678           | ABC University | COMPANY    |
      | mo          | PERSONAL        | mo@gmail.com         | SWIFT          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Mahmoud Khalil  | 50001121                    | aba                 | US              | JP Morgan Chase Bank                    | 123456781234567812 | ABC University | COMPANY    |
      | moha        | PERSONAL        | moha@gmail.com       | SWIFT          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Mahmoud Khalil  | 123456789012345678911111111 | aba                 | US              | JP Morgan Chase Bank                    | CHASUS33           | ABC University | COMPANY    |
      | Khalil      | PERSONAL        | khalil@gmail.com     | SWIFT          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | M               | 50001121                    | aba                 | US              | JP Morgan Chase Bank                    | CHASUS33           | ABC University | COMPANY    |
      | mo van gijl | PERSONAL        | mokhalil@gmail.com   | TEST           | Melbourne | AU          | VIC 3000 | Victoria         | 191 Swanston St | AUD             | Mahmoud Khalil  | 50001121                    | bsb                 | AU              | Commonwealth Bank                       | CHASAUQZ           | zabadou        | COMPANY    |
      | Khalil      | PERSONAL        | khalil@gmail.com     | LOCAL          | Melbourne | AU          | VIC 3000 | Victoria         | 191 Swanston St | AUD             | Mahmoud Khalil  | 50001121                    | bsb                 | TS              | JP Morgan Chase Bank                    | CHASAUYU           | ABC University | COMPANY    |
      | Khalil      | PERSONAL        | khalil@gmail.com     | SWIFT          | Melbourne | AU          | VIC 3000 | Victoria         | 191 Swanston St | AUD             | Mahmoud Khalil  | 500                         | bsb                 | AU              | JP Morgan Chase Bank                    | CHASAUYU           | ABC University | COMPANY    |
      | Khalil      | PERSONAL        | khalil@gmail.com     | SWIFT          | Melbourne | AU          | VIC 3000 | Victoria         | 191 Swanston St | AUD             | ibrahim Khalil  | 5009315247                  | bsb                 | AU              | JP Morgan Chase Bank                    | CHASAUYU           | ABC University | COMPANY    |
      | rKhalil     | PERSONAL        | khalil@gmail.com     | LOCAL          | Beijing   | CN          | 100032   | Xicheng District | Fuxingmen S St  | CNY             | rami Khalil     | 1234567                     |                     | CN              | Industrial and Commercial Bank of China | CHASCNYU           | ABC University | COMPANY    |
      | rKhalil     | PERSONAL        | khalil@gmail.com     | SWIFT          | Beijing   | CN          | 100032   | Xicheng District | Fuxingmen S St  | CNY             | radwa Khalil    | 5009315247500931524790345   |                     | CN              | Industrial and Commercial Bank of China | CHASCNYU           | ABC University | COMPANY    |
      | rKhalil     | PERSONAL        | khalil@gmail.com     | SWIFT          | Beijing   | CN          | 100032   | Xicheng District | Fuxingmen S St  | CNY             | radwa Khalil    | 50093152478                 | bsb                 | CN              | Industrial and Commercial Bank of China | CHASCNYU           | ABC University | COMPANY    |
      | Mark        | PERSONAL        | markgotten@gmail.com | LOCAL          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Mark gottenburg | 50001121                    | aba                 | US              | JP Morgan Chase Bank                    | CHASIS             | ABC University | COMPANY    |
      | Mark        | PERSONAL        | markgotten@gmail.com | LOCAL          | Seattle   | US          | 98104    | Washington       | 412 5th Avenue  | USD             | Mark gottenburg | 50001121                    | aba                 | US              | JP Morgan Chase Bank                    | CHASUS90000000000  | ABC University | COMPANY    |
      | mo van gijl | PERSONAL        | mokhalil@gmail.com   | SWIFT          | Melbourne | AU          | VIC 3000 | Victoria         | 191 Swanston St | AUD             | Mahmoud Khalil  | 50001121                    | aba                 | AU              | Commonwealth Bank                       | CHASAUQZ           | zabadou        | COMPANY    |
      | rKhalil     | PERSONAL        | khalil@gmail.com     | LOCAL          | Beijing   | CN          | 100032   | Xicheng District | Fuxingmen S St  | CNY             | rami Khalil     | 123456787                    | aba                 | CN              | Industrial and Commercial Bank of China | CHASCNYU           | ABC University | COMPANY    |


  @CreateBeneficiary @Regression
  Scenario Outline: Create Beneficiary with valid request
    Given Create Beneficiary Request "with valid paramms" "<nickname>" "<payerEntityType>" "<personalEmail>" "<paymentMethods>"  "<city>" "<countryCode>" "<postcode>" "<state>" "<streetAddress>" "<accountCurrency>" "<accountName>" "<accountNumber>" "<accountRoutingType1>" "<bankCountryCode>" "<bankName>" "<swiftCode>" "<companyName>" "<entityType>"
    Then Then user calls "CreateBeneficiary" with "POST" http request
    And the API call for "status" returned success with status code 201

    Examples:
      # Creating US, AU CN country code beneficiary
      | nickname  | payerEntityType | personalEmail     | paymentMethods | city    | countryCode | postcode | state      | streetAddress  | accountCurrency | accountName    | accountNumber | accountRoutingType1 | bankCountryCode | bankName             | swiftCode | companyName    | entityType |
      | mo khalil | PERSONAL        | mkhalil@gmail.com | SWIFT          | Seattle | US          | 98104    | Washington | 412 5th Avenue | USD             | Mohamed Khalil | 50001121      | aba                 | US              | JP Morgan Chase Bank | CHASUS33  | ABC University | COMPANY    |
      | rami      | PERSONAL        | rami@gmail.com    | SWIFT          | Seattle | US          | 98104    | Washington | 412 5th Avenue | USD             | rami Khalil    | 50001121      | aba                 | US              | JP Morgan Chase Bank | CHASUS33  | ABC University | COMPANY    |
      | radwa     | PERSONAL        | radwa@gmail.com   | SWIFT          | Seattle | US          | 98104    | Washington | 412 5th Avenue | USD             | radwa Khalil   | 50001121      | aba                 | US              | JP Morgan Chase Bank | CHASUS33  | ABC University | COMPANY    |

