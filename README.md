# basebox
Ansible scripts to build a simple Ubuntu basebox on KVM.

## Build

There is a dependency on [devbox](https://github.com/esfcapital/devbox) and
we assume that your workstation is up to date.

```
make
```

This will build an Ubuntu VM called *basebox* with it disks image in ~/disks/basebox.img.
The directory will be created if it does not exist.

The build script will end while the basebox is still building.  We still need
to improve this but meanwhile this is the current behaviour.  To check that
everything is working properly, you can use the virt manager:

```
virt-manager
```

and double click on the basebox entry.  You should see the box being installed.
The VM will shutdown at the end of the process.

## IP address
The ip address of the basebox can be obtained by login to it (see Access below).

It is also visible during the build:

```
TASK [basebox : Add the VM we created (by IP address) to their group] **********
changed: [localhost -> localhost] => (item= vnet0      52:54:00:70:6a:13    ipv4         192.168.122.50/24)
```

You can also run the following command while the VM is running:

```
virsh domifaddr basebox
```

which will return something like this:

```
 Name       MAC address          Protocol     Address
 -------------------------------------------------------------------------------
  vnet0      52:54:00:70:6a:13    ipv4         192.168.122.50/24

```

## Access

The basebox username and password are basebox/basebox.
In addition, an [unsecure public key](roles/basebox/files/basebox_unsecure_key.pub) 
is baked in the basebox user .ssh/authorized_keys.  You can therefore
ssh to the box using the identity given by the given
[unsecure private key](roles/basebox/files/basebox_unsecure_key).

## Use by the platform

The [platform](https://github.com/esfcapital/platform) current operation is to
clone the basebox using *virsh-clone*.  It means that you currently need
to keep it defined in libvirt. In other words, do not remove it from virt-manager.
