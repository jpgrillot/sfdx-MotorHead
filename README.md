# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Develop on the Project

  * Create the Scratch Org
  * Push the Source to the Scratch Org
  * Assign Permission Set: sfdx force:user:permset:assign -n MotorHeadApp -u sfdxMotorHead
  * Deploy the Test Data: sfdx force:data:tree:import -u sfdxMotorHead -p test-data/motor-data-plan.json
  * Run the test-data/test-data-fix.apex file to fix the Test Data issues
    * Open the apex file, open the command prompt, and search "SFDX: Execute Anonymous Apex with Editor Contents"
  * Run the Manual steps outlined in scripts/manual/NewOrg.md

### Useful Info
  * This query can help establish whether your flows are covered by your Apex Tests: sfdx force:data:soql:query --query "SELECT Id, ApexTestClassId, TestMethodName, FlowVersionId, NumElementsCovered, NumElementsNotCovered FROM FlowTestCoverage" --usetoolingapi -u sfdxMotorHead  

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
