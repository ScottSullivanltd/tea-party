## GraphQL

GraphQL endpoints have two categories: queries and mutations.

### Queries

1. getCustomer(id: ID) *finds a specific customer in the Database*

* Example Query

```
{
  getCustomer(id: "1") {
    id
    firstName
    lastName
    email
    address
  }
}
```

* Example Response

```
{ 
  "data": {
    "getCustomer": {
        "firstName": "Dani"
        "lastName": "Coleman"
        "email": "dani@coleman.ltd"
        "address": "123 Main St, Denver, Co 80002"
    }
  }
}
```

2. getTea(id: ID) *finds a specific tea in the Database*

* Example Query

```
{
   getTea(id: "4")
   {
     title
     description
     temperature
     brewTime
   }
}
 ```

* Example Response

```
{ 
  "data": {
    "getTea": {
        "title": "Earl Grey"
        "description": "Herbal"
        "temperature": 101.5
        "brewTime": 35
    }
  }
}
```
3. getCustomerSubscription(customer_id:, tea_id:) *activates a subscription for a specific customer*

* Example Query

```
query {
    getCustomerSubscription(customerId: ID, teaId: ID) [
    {
      title
      price
      status
      frequency
    }
    ]
  }
```

* Example Response

```
{
  "data": {
      "getCustomerSubscription": [
          {
            "title": "Earl Grey",
            "price": 12.95,
            "status": "active",
            "frequency": "monthly",
            "customerId": 44,
            "teaId": 12
          }
      ]
  }
}
```

### Mutations

1. createCustomer(CreateUserInput) *creates a customer with name, email, and address*

* Example Query

```
mutation {
  createCustomer(
  input: {
    firstName: "Dani"
    lastName: "Coleman"
    email: "dani@coleman.ltd"
    address: "123 My Street, Denver, CO 80002"
  }
}
```

* Example Response

```
{
  "data": {
    "createCustomer": {
      "firstName": "Dani"
      "lastName": "Coleman"
      "email": "dani@coleman.ltd"
      "address": "123 My Street, Denver, CO 80002"
    }
  }
}
```

2. createTea(CreateTeaInput) *creates a tea with title, description, temperature, and brew time*

* Example Query

```
mutation {
  createTea(
  input: {
    title: "Earl Grey"
    description: "Herbal"
    temperature: 101.5
    brewTime: 35
  }
}
```

* Example Response

```
{
  "data": {
    "createTea": {
      "title": "Earl Grey"
      "description": "Herbal"
      "temperature": 101.5
      "brewTime": 35
    }
  }
}
```

3. createSubscription(CreateSubscriptionInput) *creates a subscription with title, price, status, and frequency*

* Example Query

```
mutation {
  createSubscription(
  input: {
    title: "Earl Grey"
    price: 12.95
    status: "active"
    frequency: "monthly"
    customerId: 33
    teaId: 12
  }
}
```

* Example Response

```
{
  "data": {
    "createSubscription": {
      "title": "Earl Grey"
      "price": 12.95
      "status": "active"
      "frequency": "monthly"
      "customerId": 33
      "teaId": 12
    }
  }
}
```

4. updateSubscription(UpdateSubscriptionInput) *updates a subscription*

* Example Query

```
mutation {
  updateSubscription(
  input: {
    title: "Earl Grey"
    price: 12.95
    status: "cancelled"
    frequency: "monthly"
    customerId: 33
    teaId: 12
  }
}
```

* Example Response

```
{
  "data": {
    "updateSubscription": {
      "title": "Earl Grey"
      "price": 12.95
      "status": "cancelled"
      "frequency": "monthly"
      "customerId": 33
      "teaId": 12
    }
  }
}
```
