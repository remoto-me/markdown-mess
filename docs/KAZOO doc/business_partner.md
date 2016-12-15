<!--
Section: Crossbar
Title: Business Partner
Language: en-NZ
-->

# Business Partners

Crossbar endpoint to deal with anything related to a Camel business partner.
Related information is stored in the extended_props database.

## Billing Contacts

### GET - Get all billing contacts on the account

#### Request

    curl -v -X GET -H "X-Auth-Token: {auth_token}" http://server:8000/v2/accounts/{account_id}/business_partner/billing_contacts

#### Response

``` javascript
{
    "data": [
        {
            "email": "johnsmith@hotmail.com", 
            "user_id": "1000001", 
            "name": "John Smith", 
            "phone": "1234567"
            "mobile": "0211234567"
            "business_partner_location_id": "1000002"
        }, 
        {
            "email": "marysmith@gmail.com", 
            "user_id": "1000009", 
            "name": "Mary Smith", 
            "phone": "7654321"
            "mobile": "0277654321"
        }
    ], 
}

```


### POST - Update a resource:

Update all the billing contacts on the account. Billing contacts without an `user_id` attribute will be created, with a `user_id` field will be modified, and those left out of the query will be removed.

#### Request

    curl -v -X POST -H "X-Auth-Token: {auth_token}" -H "Content-Type: application/json" http://server:8000/v2/accounts/{account_id}/business_partner/billing_contacts -d '{ [{"name": "John Smithson", "email": "johnnewemail@gmail.com", "phone": "1234567", "user_id": "1000001", "business_partner_location_id": "1000002"}, {"name": "Tate Smith", "email": "smithtate@gmail.com", "phone": "0221357642"}] }' 
#### Response

``` javascript
{
     [
        {
            "email": "johnnewemail@gmail.com", 
            "user_id": "1000001", 
            "name": "John Smithson", 
            "phone": "1234567"
            "business_partner_location_id": "1000002"
        }, 
        {
            "email": "smithtate@gmail.com", 
            "user_id": "1000005", 
            "name": "Tate Smith", 
            "phone": "0221357642"
        }
    ] 
}
```

## Locations

### GET - Get all locations for an account. Currently gets locations directly from Camel

#### Request

    curl -v -X GET -H "X-Auth-Token: {auth_token}" http://server:8000/v2/accounts/{account_id}/business_partner/locations

#### Response

``` javascript
{
    "data": [
        {
            "address_1": "PO Box 12345", 
            "address_2": "Devonport", 
            "business_partner_id": 1000001, 
            "business_partner_location_id": 1000007, 
            "city": "North Shore City", 
            "city_id": 12, 
            "country_id": 262, 
            "is_active": true, 
            "location_id": 1000392, 
            "name": "PO Box", 
            "region": "Auckland", 
            "region_id": 27, 
            "zip": "1234"
        }, 
        {
            "address_1": "2 Erlang St", 
            "address_2": "Devonport", 
            "business_partner_id": 1000001, 
            "business_partner_location_id": 1000008, 
            "city": "North Shore City", 
            "city_id": 12, 
            "country_id": 262, 
            "is_active": true, 
            "location_id": 1000063, 
            "name": "Office", 
            "region": "Auckland", 
            "region_id": 27, 
            "zip": "1234"
        }
    ], 
}

```

### PUT - Create a location for an account

#### Request

    curl -v -X PUT -H "X-Auth-Token: {auth_token}" http://server:8000/v2/accounts/{account_id}/business_partner/locations -d '{"data": {"address_1": "19 ABC St", "address_2": "Devonport", "city": "Auckland", "city_id": 0, "country_id": 262, "name": "Main Location", "region_id": 0, "zip": "0625"}}'

#### Response

``` javascript
{
    "data": {
        "address_1": "19 ABC St", 
        "address_2": "Devonport", 
        "business_partner_location_id": "123456", 
        "city": "Auckland", 
        "city_id": 0, 
        "country_id": 262, 
        "name": "Main Location", 
        "region_id": 0, 
        "zip": "0625"
    }, 
    "request_id": "e8708e8f5f5dd9cdd171063a3ea3c14a", 
    "revision": "undefined", 
    "status": "success"
}

```
