resource "aci_rest" "mgmtOoB" {
  dn         = "uni/tn-mgmt/mgmtp-default/oob-${var.endpoint_group}"
  class_name = "mgmtOoB"
  content = {
    name = var.endpoint_group
  }
}

resource "aci_rest" "mgmtRsOoBStNode" {
  dn         = "${aci_rest.mgmtOoB.dn}/rsooBStNode-[topology/pod-${var.pod_id}/node-${var.node_id}]"
  class_name = "mgmtRsOoBStNode"
  content = {
    addr = var.ip
    gw   = var.gateway
    tDn  = "topology/pod-${var.pod_id}/node-${var.node_id}"
  }
}
