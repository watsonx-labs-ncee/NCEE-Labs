
# 🧑‍💼 AskHR: Automate HR tasks with Agentic AI

## Table of Contents

- [Use Case description](#use-case-description)
- [Architecture](#architecture)
- [Pre-requisites](#pre-requisites)
- [Instructions](#instructions)
  - [Open Agent Builder](#open-agent-builder)
  - [Create HR Agent](#create-hr-agent)
  - [Test HR Agent in preview](#test-hr-agent-in-preview)
  - [Test HR Agent in AI Chat](#test-hr-agent-ai-chat)

## Use Case Description

This use case targets developing and deploying an AskHR agent leveraging IBM watsonx Orchestrate, as depicted in the provided architecture diagram. This agent will empower employees to interact with HR systems and access information efficiently through conversational AI. 

In this lab we will build an HR agent in watsonx Orchestrate, leveraging tools and external knowledge to connect to a simulated Human Capital Management System. This agent retrieves relevant information from documents to answer user queries and  allows users to view and manage their profiles.

## Architecture

<img width="1000" alt="image" src="arch_diagm.png">


## Pre-requisites

- Check with your instructor to make sure **all systems** are up and running before you continue.
- Validate that you have access to the right techzone environment for this lab.
- Validate that you have access to a credentials file that you instructor will share with you before starting the labs.
- If you're an instructor running this lab, check the **Instructor's guides** to set up all environments and systems.


## Instructions

### Open Agent Builder

- Log in to IBM Cloud (cloud.ibm.com). Navigate to top left hamburger menu, then to Resource List. Open the AI/Machine Learning section. You should see a **watsonx Orchestrate** service, click to open.

  <img width="1000" alt="image" src="../../../environment-setup/assets/cloud-resource-list.png">

- Click the "Launch watsonx Orchestrate" button.

   <img width="1000" alt="image" src="../../../environment-setup/assets/cloud-wxo.png">

- Welcome to watsonx Orchestrate. Open the hamburger menu, click on the down arrow next to **Build**.  Then click on **Agent Builder**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_1_v2.png">

### Create HR Agent
1. Click on **Create agent +**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_2_v2.png">

1. Select **Create from scratch**, give your agent a name, e.g. `HR Agent`, and fill in the **Description** as shown below: 

   ```
   You are an agent who handles employee HR queries.  You provide short and crisp responses, keeping the output to 200 words or less.  You can help users check their profile data, retrieve latest time off balance, update title or address, and request time off. You can also answer general questions about company benefits.
   ```  
   Click on **Create**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_3_v2.png">
<!--   
1. Click on the down arrow against **Model**. Select Model "llama-3-405b-instruct"

   <img width="1000" alt="image" src="hands-on-lab-assets/step_4_v2.png">
-->   
1. Select **Default** in **Agent style** section.

   <img width="1000" alt="image" src="hands-on-lab-assets/step_5_v2.png">
   
1. Scroll down the screen to the **Knowledge** section.
   Click on **Choose knowledge**.
   
   <img width="1000" alt="image" src="hands-on-lab-assets/step_6_v3.png">
  
1. Select **Upload files**.
   Click on **Next**.
   
   <img width="1000" alt="image" src="hands-on-lab-assets/step_7_v3.png">
     
1. Download the [Employee Benefits.pdf](/usecases/ask-hr/assets/Employee-Benefits.pdf) onto your system, then upload the file here.
   Click on **Next**.

   <img width="1000" alt="image" src="hands-on-lab-assets/step_8_v3.png">

1. Copy the following description into the **Description** section and then click on **Save**:

   ```
   This knowledge base addresses the company's employee benefits, including parental leaves, pet policy, flexible work arrangements, and student loan repayment.
   ```
   
   <img width="1000" alt="image" src="hands-on-lab-assets/step_8.1_v3.png">

1. Scroll down to the **Toolset** section. Click on **Add tool +**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_9_v3.png">

1. Select **Import**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_10_v3.png">

1. Select **Import from file**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_11_v3.png">

1. Drag and drop or click to upload the **hr.yaml** file (provided to you by the instructor), then click on **Next**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_12_v3.png">    

1. Select all the operations and click on **Done**:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_13_v3.png">

1. Scroll down to the **Behavior** section. Insert the instructions below into the **Instructions** field:

   ```
   Use your knowledge base to answer general questions about employee benefits. 

   Use the tools to get or update user specific information.

   When user asks to show profile data or check time off balance or update title/address or request time off for the very first time,  first ask the user for their name,  then invoke the tool and then use the same name in the whole session without asking for the name again.

   When the user requests time off, convert the dates to YYYY-MM-DD format, e.g. 5/22/2025 should be converted to 2025-05-22 before passing the date to the post_request_time_off tool.
   ```
1. Turn on the toggle button for **Chat with documents**. Select **None** in **Citations show in webchat**. Turn on the toggle button for **Show agent**. Click on **Deploy** in the top right corner to deploy your agent:

   <img width="1000" alt="image" src="hands-on-lab-assets/step_14_v3.png">

### Test HR Agent in Preview
Test your agent in the preview chat on the right side by asking the following questions and validating the responses.  They should look similar to what is shown in the screenshots below:

```
What is the pet policy? 
```
<img width="1000" alt="image" src="hands-on-lab-assets/hr_step13.png">

```
Show me my profile data.
I'd like to update my title. 
```
<img width="1000" alt="image" src="hands-on-lab-assets/hr_step13_2.png">

```
Update my address
What is my time off balance?
```
<img width="1000" alt="image" src="hands-on-lab-assets/hr_step13_3.png">

```
Request time off
Show my profile data.
```
<img width="1000" alt="image" src="hands-on-lab-assets/hr_step13_4.png">

#### Test HR Agent AI Chat

Test the Agent from the AI Chat window. Click on the hamburger menu in the top left corner and then click on **Chat**:

<img width="1000" alt="image" src="hands-on-lab-assets/step_16_v2.png">

Make sure **HR Agent** is selected. You can now test your agent:

<img width="1000" alt="image" src="hands-on-lab-assets/hr_step16.png">
