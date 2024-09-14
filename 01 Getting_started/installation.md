# Installing Terraform:

## For macOS/Linux:

1. Open the terminal and run the following commands:

```sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install terraform
```

2. Verify the installation

    ``` terraform -v ```

## For Windows:
1. Download Terraform from the official website.
2. Extract the downloaded file and place the binary in a folder included in your system’s PATH.
3. Verify installation via Command Prompt or PowerShell:
    ``` terraform -v ```