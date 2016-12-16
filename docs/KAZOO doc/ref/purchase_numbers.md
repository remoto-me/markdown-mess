### Purchase_numbers

#### About Purchase_numbers

#### Schema

Key | Description | Type | Default | Required
--- | ----------- | ---- | ------- | --------
`location_id` | The location to purchase numbers for | `string` |   | `true`
`numbers` | The numbers to be purchased | `array(object)` |   | `true`
`numbers.[].is_fax` | Is the phone number for a fax? | `boolean` |   | `true`
`numbers.[].number` | The number to be purchased | `string` |   | `true`
`numbers.[].type` | The type of line number to be purchased | `string('mainline', 'ddi', 'tollfree')` |   | `true`


#### Create

> PUT /v2/accounts/{ACCOUNT_ID}/purchase_numbers

```shell
curl -v -X PUT \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/purchase_numbers
```

#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/purchase_numbers/prices

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/purchase_numbers/prices
```

#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/purchase_numbers/regions

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/purchase_numbers/regions
```

#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/purchase_numbers/regions/{REGION}

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/purchase_numbers/regions/{REGION}
```

