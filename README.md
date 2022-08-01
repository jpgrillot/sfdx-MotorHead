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

## Deploy the Project

  * Update the sfdx-project.json with the Version
  * Create a new version with Code Coverage:
  sfdx force:package:version:create -v DevHub -p "MotorHead" -x -w 10 -c
  * Promote the version: 
  sfdx force:package:version:promote -p "VERSION"
  * Install the Package
  sfdx force:package:install -w 10 --publishwait 10 --package MotorHead@1.1.0-1 --noprompt -u DevHub