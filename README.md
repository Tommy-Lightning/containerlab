# Containerlab Proof of Concepts

This repository contains Containerlab YAML files and configuration files to create virtualised network infrastructure for vendor PoCs.

A reference sheet for containerlab commands [can be found here](https://containerlab.dev/cmd/deploy/).

In order to start a containerlab environment, run the command:

`containerlab deploy -t {containerlab_config_file}`

In order to inspect a containerlab environment, run the command:

`containerlab inspect --name {environment_name}`

In order to destroy a containerlab environment, run the command:

`containerlab destroy -t {containerlab_config_file}`

## Topology

The following diagrams detail the topology that will be replicated in containerlab for the PoCs.

### Phyiscal Topology

![Physical Topology](images/phys_topology.png)

## Nokia

To access this lab and set up the environment, download this repo and perform the following tasks:

- Install Docker - [a guide on how to do so can be found here](https://docs.docker.com/engine/install/)
- Install Containerlab - [a guide on how to do so can be found here](https://containerlab.dev/install/)
- Use the dockerfile provided to create a container called `sshubuntu`:
    `sudo docker build -t sshubuntu .`
- If the configurations don't auto-deploy, copy and paste the configurations in the `{devicename}.cli` files to the relevant devices.

There is a bash script in this repo called `nokia_lab_build.sh` - all install tasks can be completed and the entire lab can be deployed by running the command:

`bash nokia_lab_build.sh`

The user running the script will require sudo privileges.

### Accessing the Lab

Once the commands to build the lab have been issued and the lab is built, the devices in the lab can be accessed from the machine they've been deployed on via ssh.

To access the switches, use the `admin` user with no password, e.g.:

`ssh admin@clab-nokia_lab-leaf1`

To access the servers use the username `ubuntu` and the password `ubuntu`:

`ssh ubuntu@clab-nokia_lab-srv1`

### ASNs

| ASN | Devices | Description |
| ----------- | ----------- | ----------- |
| 100 | leaf1, leaf2, leaf3, leaf4, border-leaf1 | iBGP overlay ASN |
| 101 | leaf1 | leaf1 private ASN |
| 102 | leaf2 | leaf2 private ASN |
| 103 | leaf3 | leaf3 private ASN |
| 104 | leaf4 | leaf4 private ASN |
| 201 | spine1, spine2 | Spine private ASN |
| 901 | border-leaf1 | border-leaf1 private ASN |
| 65000 | wan1, wan2 | BGP ASN for WAN connectivity |

### Layer 2 Services Information

#### VXLAN VTEP configuration

```

enter candidate
    /tunnel-interface vxlan1 {
        vxlan-interface 1 {
            type bridged
            ingress {
                vni 1
            }
        }
    }
commit now
```

#### MAC-VRFs

| MAC VRFs| Description |
| ----------- | ----------- |
| mac-vrf-management | Management network |
| mac-vrf-openstack-tenant | Openstack tenant network |
| mac-vrf-openstack-api | Openstack API network |
| mac-vrf-ironic | Openstack Ironic L2 network |
| mac-vrf-openstack-lb-mgmt | Openstack load balancer L2 management network |
| mac-vrf-provisioning | Server provisioning network |
| mac-vrf-caph-private | Ceph private network |
| mac-vrf-ceph-public | Ceph public network |
| mac-vrf-internet-customer | Customer internet network |
| mac-vrf-internet-private | Internal internet network |

####

### Fabric Link IP addresses

**leaf1**

ASN: 101

| Interface      | IP Address |
| ----------- | ----------- |
| 1/48.0 | 192.168.11.1 |
| 1/49.0 | 192.168.11.5 |
| sys0.0 | 10.0.0.1 |

**leaf2**

ASN: 102

| Interface      | IP Address |
| ----------- | ----------- |
| 1/48.0 | 192.168.12.1 |
| 1/49.0 | 192.168.12.5 |
| sys0.0 | 10.0.0.2 |

**leaf3**

ASN: 103

| Interface      | IP Address |
| ----------- | ----------- |
| 1/48.0 | 192.168.13.1 |
| 1/49.0 | 192.168.13.5 |
| sys0.0 | 10.0.0.3 |

**leaf4**

ASN: 104

| Interface      | IP Address |
| ----------- | ----------- |
| 1/48.0 | 192.168.14.1 |
| 1/49.0 | 192.168.14.5 |
| sys0.0 | 10.0.0.4 |

**boarder-leaf1**

ASN: 901

| Interface      | IP Address |
| ----------- | ----------- |
| 1/1.0 | 192.168.21.1 |
| 1/2.0 | 192.168.21.5 |
| 1/36.10 | 100.64.0.0 |
| 1/36.20 | 100.64.0.2 |
| sys0.0 | 10.0.10.1 |

**spine1**

ASN: 201

| Interface      | IP Address |
| ----------- | ----------- |
| 1/1.0 | 192.168.11.2 |
| 1/2.0 | 192.168.12.2 |
| 1/3.0 | 192.168.13.2 |
| 1/4.0 | 192.168.14.2 |
| 1/32.0 | 192.168.21.2 |
| 1/33.0 | 192.168.51.1 |
| 1/34.0 | 192.168.51.1 |
| sys0.0 | 10.0.1.1 |

**spine2**

ASN: 201

| Interface      | IP Address |
| ----------- | ----------- |
| 1/1.0 | 192.168.11.6 |
| 1/2.0 | 192.168.12.6 |
| 1/3.0 | 192.168.13.6 |
| 1/4.0 | 192.168.14.6 |
| 1/32.0 | 192.168.21.6 |
| 1/33.0 | 192.168.51.2 |
| 1/34.0 | 192.168.51.2 |
| sys0.0 | 10.0.1.2 |

**wan1**

ASN: 65000

| Interface      | IP Address |
| ----------- | ----------- |
| 1/1.10 | 100.64.0.0 |
| 1/1.20 | 100.64.0.2 |
| 1/48.10 | 100.64.2.1 |
| 1/48.20 | 100.64.2.3 |
| sys0.0 | 100.64.1.1 |

**wan2**

ASN: 65000

| Interface      | IP Address |
| ----------- | ----------- |
| 1/48.10 | 100.64.2.1 |
| 1/48.20 | 100.64.2.3 |
| sys0.0 | 100.64.1.2 |

### IRB interface IP addresses

| Interface | MAC VRF Association | IP VRF Association | IP Address |
| ----------- | ----------- | ----------- | ----------- |
| irb0.100 | mac-vrf-management | ip-vrf-management | 10.10.100.1/24 |
| irb0.101 | mac-vrf-openstack-tenant | ip-vrf-management | 10.10.101.1/24 |
| irb0.102 | mac-vrf-openstack-api | ip-vrf-management | 10.10.102.1/24 |
| irb0.105 | mac-vrf-provisioning | ip-vrf-management | 10.10.105.1/24 |
| irb1.300 | mac-vrf-ceph-private | ip-vrf-storage | 10.10.200.1/24 |
| irb1.301 | mac-vrf-ceph-public | ip-vrf-storage | 10.10.200.1/24 |
| irb2.200 | mac-vrf-internet-customer | ip-vrf-internet-customer | 185.47.227.129/24 |
| irb3.200 | mac-vrf-internet-private | ip-vrf-internet-private | 185.47.227.1/24 |

### Multi-Homing/Link Aggregation

The following LACP parameters must be consistent across switches that a multi-homed aggregated link is configured on:
- admin-key
- system-id-mac
- system-priority

An example of a LAG configuration can be seen below:

```
interface lag1 {
    admin-state enable
    vlan-tagging true
    subinterface 1 {
        type bridged
        vlan {
            encap {
                single-tagged {
                    vlan-id 1
                }
            }
        }
    }
    lag {
        lag-type lacp
        member-speed 100G
        lacp {
            interval FAST
            lacp-mode ACTIVE
            admin-key 24
            system-id-mac 00:00:00:00:00:24
            system-priority 24
        }
    }
}
```

An ethernet segment needs to be configured for each multi-homed aggregated link as per the following:

```
system network-instance {
    protocols {
        evpn {
            ethernet-segments {
                bgp-instance 1 {
                    ethernet-segment ES-1 {
                        admin-state enable
                        esi 01:24:24:24:24:24:24:00:00:01
                        interface lag1
                        multi-homing-mode all-active
                    }
                }
            }
        }
        bgp-vpn {
            bgp-instance 1 {
            }
        }
    }
}
```

The LAG subinterfaces need to be added to the correct MAC VRF as follows:

```
network-instance vrf-100 {
    interface lag1.100
}
```