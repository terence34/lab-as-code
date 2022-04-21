variable "list_of_networks" {
  type = list(any)
  default = ["isp1net1",
  "isp1-isp2",
  "isp1-isp6",
  "isp2net1",
  "isp3net1",
  "isp4net1",
  "isp5net1",
  "isp6net1",
  ]
}

resource "libvirt_network" "ispnet" {
  count = "${length(var.list_of_networks)}"
  name = "${var.list_of_networks[count.index % length(var.list_of_networks)]}"
  domain = "${var.list_of_networks[count.index % length(var.list_of_networks)]}"
  mode = "none"
  dhcp {
    enabled = false
  }
  dns {
    enabled = false
  }
}
