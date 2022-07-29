# README

## Table of Contents

- [Local Deployment](#local-deployment)
- [Description](#description)
- [PostgreSQL Schema](#postgresql-schema)
- [GraphQL Endpoints](#graphql-endpoints)
- [Contact Info](#contact-info)

## Deployed App

Vist the deployed PlanIt app at [https://planit-earth.netlify.app/](https://planit-earth.netlify.app/)

## Local Deployment

See this [Local Setup Guide](local_setup_guide.md) for detailed instructions on how to deploy the app in a local environment.

## Description

This repo is a GraphQL API built with Ruby on Rails and PostgreSQL. It provides data, logic, and other services for a Front-end to record a customer, tea types, and subscriptions for a customer to get teas delivered at a pre-determined frequency.

## PostgreSQL Schema

| Customers | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| first_name | String |  |
| last_name | String |  |
| email | String |  |
| address | String | |


| Teas | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| title | String |  |
| description | String |  |
| temperature | Float |  |
| brew_time | Integer | |


| Subscriptions | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| customer_id | Integer | Customer Foreign Key|
| tea_id | Integer | Tea Foreign Key|
| title | String | |
| price | Float | |
| status | String | |
| frequency | String | |


## GraphQL Endpoints

The GraphQL endpoints fall into two categories: queries and mutations. For detailed examples of all the endpoints and example responses, see our [GraphQL Endpoints Guide](graphql_endpoints.md) or click the specific query or mutation below to go its section.

To make live queries to the GraphQL endpoint and see live schema information, setup the [local deployment instructions](local_setup_guide.md).

- Queries
  - [getCustomer](graphql_endpoints.md#get-customer)
  - [getTea](graphql_endpoints.md#get-tea)
  - [getCustomerSubscription](graphql_endpoints.md#get-customer-subscription)

- Mutations
  - [createCustomer](graphql_endpoints.md#create-customer)
  - [createTea](graphql_endpoints.md#create-tea)
  - [createSubscription](graphql_endpoints.md#create-subscription)
  - [updateSubscription](graphql_endpoints.md#update-subscription)

## Contact Info

 - Scott Sullivan ([@ScottSullivanltd](https://github.com/ScottSullivanltd), [LinkedIn](https://linkedin.com/in/scott-sullivan-9394204a/))
