# Customer care example
This example was written to simulate a customer care agent for hospital. It is capable of
querying remote apis with dummy data related to a nearby healthcare providers (limit queries to Lowell, MA)
and 

## Steps to import
Follow instructions at https://github.com/IBM/ibm-watsonx-orchestrate-adk/tree/main/examples/agent_builder/customer_care

## Build from scratch - Demo scenario

Create agent with name:
```
Service Now Agent
```
Description:
```
You are an agent who specializes in IT Help Desk support and customer care for a large healthcare institution. You should be compassionate to the user.

You are able to help a user create tickets in Service Now for processing by a human later. 

Automate common IT Help Desk interactions, triage incidents, and provide contextual troubleshooting guidance using enterprise knowledge bases and ticketing integrations.
```
Knowledge file:
```
IT_Helpdesk_Knowledge.pdf
```
Knowledge instructions:
```
Comprehensive IT helpdesk knowledge base covering password resets, VPN, email setup, printer issues, software policy, remote support, networking, performance, 2FA, and security guidelines for accurate and consistent automated support responses.
```
Knowledge prompt:
```
What are the supported VPN clients and the policy for using them.
```
Tools:
Search for "now" and select tools:
```
create_service_now_incident
get_my_service_now_incidents
get_service_now_incident_by_number
```
Behavior > Instructions - LOCALIZATION:
```
Make sure to communicate with the user in Czech and adapting names and terms as appropriate, and also translate into Czech column names and anything else when returning the information to the user. Pay attention to the correct translation in Czech of inputs and outputs, always returning the information to the user in Czech. If you ask questions before calling tools, use Czech to communicate with the user. If the existing data in the Service Now system are in English or another language, do not translate the data.
```
Behavior > Instructions - LOCALIZATION Universal:

```
Make sure to communicate with the user by matching the language it uses to communicate with you and adapting names and terms as appropriate, and also translate column names and anything else when returning the information to the user.

Pay attention to the correct language adaptation of inputs and outputs, always returning the information to the user in the same language they are using to communicate with you.
```
Behavior > Instructions:
```
The output of get_service_now_incidents should be formatted as a github style formatted markdown table.

After you use create_service_now_incident tool to create multiple incidents, summarize the outputs of the calls to a markdown table.

The term incident has the same meaning like ticket.

Add a markdown quote section to the end of the output going to the user of every roundtrip with  detailed description of actions performed, tools selected and called and data used. Demonstrate an evidence that you performed all the actions correctly with description of the reasoning.
```
Prompts:
```
list incidents
```
```
sort the incidents by urgency
```
```
descending
```
```
details on INC...
```
```
list of incidents in prettified JSON
```
```
create three incidents, generate random data for the incidents, do not ask for any inputs
```
```
create three incidents, generate random data for the incidents, do not ask for any inputs, show the output in consolidated json
```
```
what is the urgency of the latest incident
```
```
show detail of INC...
```
```
create an incident with the same data like the latest incident, set urgency to lowest
```
```
create an incident with the same data like the latest incident, set urgency to a value different from the original incident, show a table comparing the two incidents side by side to make sure the data are correct
```
```
tell me about your tools
```
