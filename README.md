# devseed
A minimal, portable setup kit for quickly bootstrapping my development environment across machines. Includes shell aliases, IDE configs, essential packages, and tooling to recreate my daily workflow.



# Testing with Multipass

To simulate a clean Ubuntu workstation:

```bash
bash tools/multipass-setup.sh
multipass launch --name devtest
multipass shell devtest
```

Then inside the VM:

```bash
# Optional: install dependencies
sudo apt update && sudo apt install -y curl git

# Clone and run the setup project
git clone https://github.com/yourusername/dev-env.git
cd dev-env/packages
bash install.sh
```
