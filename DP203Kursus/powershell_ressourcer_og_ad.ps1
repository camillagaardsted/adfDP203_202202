# Vi vil deploye en datalake via ARM template
# se https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell

$resourceGroup='dk'

Connect-AzAccount 
# via ARM Template
New-AzResourceGroupDeployment -Name datalakedeployment -ResourceGroupName $resourceGroup -TemplateParameterFile C:\DP203Kursus\datalaketemplatedeployment\parameters.json -TemplateFile C:\DP203Kursus\datalaketemplatedeployment\template.json



Get-AzStorageAccount
$location='westeurope'
$storageaccount='std20220228'
New-AzStorageAccount -Name $storageaccount -ResourceGroupName $resourceGroup -SkuName Standard_GRS -Location $location -AccessTier Hot -Kind StorageV2 

Get-AzStorageAccount

################################## Azure AD #######################################
# brugere og grupper 

# vi skal oprette nogle brugere i Azure Ad

Get-AzDomain



# 
#su20220124outlook.onmicrosoft.com

$tenantName = 'su20220228outlook'
$pn = "$tenantName.onmicrosoft.com"


$password="Pa55w.rd"
$passwordSecure=ConvertTo-SecureString -AsPlainText $password -Force

$username="otto"
$Name="Otto Pilfinger"
$upn = "$username@$pn"
$mailnickname="ottoregnskab"
$otto=New-AzADUser -DisplayName $Name -UserPrincipalName $upn -Password $passwordSecure -MailNickname $mailnickname

$username="ottoline"
$Name="Ottoline Pilfinger"
$upn = "$username@$pn"
$mailnickname="ottolinemarketing"
$ottoline=New-AzADUser -DisplayName $Name -UserPrincipalName $upn -Password $passwordSecure -MailNickname $mailnickname



$groupName="BI group"
$mailnickname="bigruppen"
$bigroup=New-AzADGroup -DisplayName $groupName -MailNickname $mailnickname 

Add-AzADGroupMember -TargetGroupDisplayName $groupName -MemberUserPrincipalName $otto.UserPrincipalName,$ottoline.UserPrincipalName

# IT folk:

$username="ivan"
$Name="Ivan IT"
$upn = "$username@$pn"
$mailnickname="ivanit"
$ivan=New-AzADUser -DisplayName $Name -UserPrincipalName $upn -Password $passwordSecure -MailNickname $mailnickname

$username="frode"
$Name="Frode Pilfinger"
$upn = "$username@$pn"
$mailnickname="frodeit"
$frode=New-AzADUser -DisplayName $Name -UserPrincipalName $upn -Password $passwordSecure -MailNickname $mailnickname

# Opret sikkerhedsgruppe til vores to IT folk
$groupName="IT group"
$mailnickname="itgruppen"
$bigroup=New-AzADGroup -DisplayName $groupName -MailNickname $mailnickname 

Add-AzADGroupMember -TargetGroupDisplayName $groupName -MemberUserPrincipalName $ivan.UserPrincipalName,$frode.UserPrincipalName


# Opret sikkerhedsgruppe til vores to IT folk
$groupName="DBA group"
$mailnickname="dbagruppen"
$dbagroup=New-AzADGroup -DisplayName $groupName -MailNickname $mailnickname 

Add-AzADGroupMember -TargetGroupDisplayName $groupName -MemberUserPrincipalName $upn



