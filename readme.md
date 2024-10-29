# Set-ConnectorRelay PowerShell Script

## Overview
`Set-ConnectorRelay` is a PowerShell script designed to set up an SMTP relay connector in Exchange Online. This connector allows for SMTP relay from devices such as printers or applications that need to send email through your Exchange Online environment.

The script automates the process of creating an inbound connector with Exchange Online, setting up the necessary configurations, and retrieving the required SMTP details.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Parameters](#parameters)
- [Contact](#contact)
- [Disclaimer](#Disclaimer)


## Prerequisites
- **PowerShell 7.4 or higher** (or PowerShell Core for cross-platform support)
- **Exchange Online PowerShell Module**  
    - To install, run:
      ```powershell
      Install-Module -Name ExchangeOnlineManagement
      ```
      You need to have the appropriate Execution policy https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.4

- **Permissions**: A Delegated Admin access to Exchange Online is required, along with appropriate permissions to set up connectors for the specified delegated organization.

## Installation
1. Download the `Set-ConnectorRelay.ps1` script and place it in your working directory.
2. Ensure you have the necessary permissions and prerequisites installed.

## Usage
To run the `Set-ConnectorRelay` script, open a PowerShell session execute the script.

### Parameters
The script accepts the following parameters:

- `-DelegatedOrg`: The **delegated organization domain** (e.g., `.onmicrosoft.com`) for which the connector is being configured. This is a **required parameter**.
  
- `-IPaddress`: The **WAN IP address** of the device or server that will use the connector to relay emails. This is a **required parameter**.

- `-NameOFConnector`: A **name** for the new connector. Use a descriptive name to identify this connector in Exchange Online. This is a **required parameter**.

### Contact

This script is made by ME (emilthisen@gmail.com) - You're free to use it. Test it before using it.

### Disclaimer
This script is provided "as-is" without any express or implied warranty. **The author takes no responsibility for any damage or data loss resulting from its use**. By using this script, you agree to assume all risks associated with its execution and acknowledge that you are solely responsible for any actions taken based on its results. Always ensure you have adequate backups and test in a controlled environment before deploying in production.