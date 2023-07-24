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
| sys0.0 | 10.0.0.20 |

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