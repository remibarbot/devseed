# devseed
A minimal, portable setup kit for quickly bootstrapping my development environment across machines. Includes shell aliases, IDE configs, essential packages, and tooling to recreate my daily workflow.



# Testing with Multipass

To simulate a clean Ubuntu workstation:

```bash
bash tools/multipass-setup.sh
multipass launch --name testbox
multipass shell testbox
```

Then inside the VM:

```bash
# Optional: install dependencies
sudo apt update && sudo apt install -y curl git

# Clone and run the setup project
git clone https://github.com/remibarbot/devseed.git
cd devseed/packages
bash install.sh
```

To clean the VM:
```bash
multipass stop testbox
multipass delete testbox
multipass purge  # delete all data
```
