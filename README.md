# DEPENDENCES

* The Postgresql already installed and configured in Docker dependences
* Ruby ``` 2.5.9 ```
* Rails ``` 5.2.8.1 ```

# SEE

This project use Docker to run and build one app in Ruby on Rails.

When download this repository run:

``` docker compose build ```

Next, run:

``` docker compose up ```

To run a rails server:

* Open the bash of container web_1 and run in bash:

``` rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0' ```

# API documentation

* This app have only one end-point, only it will be described in this documentation.

## GET /truck_drivers/deliveries_by_fiter/:id

Return deliveries of one truck diver by filter.

### Request:

* Wrap the request in the ```?filters=```

```
{
    product: "ferro", 
    deliveries_between: {
        start_date: "2022-08-11", 
        end_date: "2022-08-14"
    }
}
```

### Response:

```
{
  "name": "Name of Truck Driver",
  "deliveries": [
    {
      "id": 8,
      "employee_id": 1,
      "truck_id": 1,
      "payload_type": "iron",
      "total_items": 10,
      "total_billing": 10.55,
      "delivery_date": "2022-08-14T14:36:40.167Z",
      "deleted_at": null,
      "created_at": "2022-08-14T14:36:40.167Z",
      "updated_at": "2022-08-14T14:36:40.167Z"
    }
  ]  
}
```

## GET /truck_drivers/:id

Return one truck diver by id.

### Request:

``` Pass only :id ```

### Response:

```
{
  "name": "Name of Truck Driver",
  "deliveries": [
    {
      "id": 8,
      "employee_id": 1,
      "truck_id": 1,
      "payload_type": "iron",
      "total_items": 10,
      "total_billing": 10.55,
      "delivery_date": "2022-08-14T14:36:40.167Z",
      "deleted_at": null,
      "created_at": "2022-08-14T14:36:40.167Z",
      "updated_at": "2022-08-14T14:36:40.167Z"
    }
  ]  
}
```

## POST /truck_drivers

Insert one truck driver.

### Request:

```
{
    "name"=>"Name of Truck Driver",
    "employee_code"=>"Hash identification"
}
```

### Response:

```
{
    "id": 8,
    "employee_id": 1,
    "truck_id": 1,
    "payload_type": "iron",
    "total_items": 10,
    "total_billing": 10.55,
    "delivery_date": "2022-08-14T14:36:40.167Z",
    "deleted_at": null,
    "created_at": "2022-08-14T14:36:40.167Z",
    "updated_at": "2022-08-14T14:36:40.167Z"
}
```

## PUT /truck_drivers/:id

Change data of truck driver.

### Request:

```
{
    "name"=>"Name of Truck Driver",
    "employee_code"=>"Hash identification"
}
```

### Response:

```
{
    "id": 8,
    "employee_id": 1,
    "truck_id": 1,
    "payload_type": "iron",
    "total_items": 10,
    "total_billing": 10.55,
    "delivery_date": "2022-08-14T14:36:40.167Z",
    "deleted_at": null,
    "created_at": "2022-08-14T14:36:40.167Z",
    "updated_at": "2022-08-14T14:36:40.167Z"
}
```

## DELETE /truck_drivers/:id

Remove one truck diver by id.

### Request:

``` Pass only :id ```

### Response:

```
{
    "id": 8,
    "employee_id": 1,
    "truck_id": 1,
    "payload_type": "iron",
    "total_items": 10,
    "total_billing": 10.55,
    "delivery_date": "2022-08-14T14:36:40.167Z",
    "deleted_at": null,
    "created_at": "2022-08-14T14:36:40.167Z",
    "updated_at": "2022-08-14T14:36:40.167Z"
}
```
