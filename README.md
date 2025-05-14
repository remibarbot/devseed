# devseed
A minimal, portable setup kit for quickly bootstrapping my development environment across machines. Includes essential packages,IDE configs, Terminal configuration and tooling to recreate my daily workflow.

## Usage
Launch the `boostrap.sh` script.

## Content

### packages
APT installable packages, and some trickier packages with custom install.

### fonts
Install script for a Nerd Font, required for proper terminal display.

### terminal
My configuration for the Wezterm terminal.

### tools
Install script for multipass

### zsh
My configuration for zsh and starship.

### git
A global git configuration


## Testing with Multipass

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
