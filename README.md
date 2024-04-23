# nix-config

## darwin

1. Install nix:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Install homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Install rosetta:

```bash
softwareupdate --install-rosetta --agree-to-license
```

4. Clone this repository:

```bash
nix-shell -p git
git clone https://github.com/nmtmason/nix-config
```

5. Install:

```bash
nix build .#darwinConfigurations.<host>.system
./result/sw/bin/darwin-rebuild switch --flake .#<host>
```

6. Reboot:

```bash
sudo reboot
```

7. Rebuild as necessary:

```bash
darwin-rebuild switch --flake .#<host>
```

## nixos

1. Make partitions:

```bash
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MB -8GB
parted /dev/sda -- mkpart primary linux-swap -8GB 100%
parted /dev/sda -- mkpart ESP fat32 1MB 512MB
parted /dev/sda -- set 3 esp
```

2. Format filesystems:

```bash
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/{boot,media}
mount /dev/disk/by-label/boot /mnt/boot
mount /dev/disk/by-label/media /mnt/media
swapon /dev/sda2
```

3. Generate `hardware-configuration.nix`:

```bash
nixos-generate-config --root /mnt
```

4. Clone this repository:

```bash
nix-shell -p git
git clone https://github.com/nmtmason/nix-config /mnt/etc/nixos/nix-config
```

5. Copy `hardware-configuration.nix`:

```bash
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/nix-config/nixos/hosts/<host>
```

6. Install:

```bash
cd /mnt/etc/nixos/nix-config
nixos-install --flake .#<host>
```

7. Reboot:

```bash
reboot
```

8. Login as root and set the password:

```bash
passwd nmtmason
smbpasswd -a nmtmason
```

9. Setup networking:

```bash
nmtui
```

10. Rebuild as necessary:

```bash
nixos-rebuild switch --flake .#<host>
```

## nixos-wsl

1. Install [NixOS-WSL](https://github.com/nix-community/NixOS-WSL).

2. Clone this repository:

```bash
nix-shell -p git
git clone https://github.com/nmtmason/nix-config nix-config
```

3. Install:

```bash
cd nix-config
nixos-install --flake .#<host>
```

4. Reboot:

```bash
wsl --shutdown
```

5. Rebuild as necessary:

```bash
sudo nixos-rebuild switch --flake .#<host>
```
