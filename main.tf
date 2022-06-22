resource "aci_rest_managed" "mgmtOoB" {
  dn         = "uni/tn-mgmt/mgmtp-default/oob-${var.endpoint_group}"
  class_name = "mgmtOoB"
  content = {
    name = var.endpoint_group
  }
}

resource "aci_rest_managed" "mgmtRsOoBStNode" {
  dn         = "${aci_rest_managed.mgmtOoB.dn}/rsooBStNode-[topology/pod-${var.pod_id}/node-${var.node_id}]"
  class_name = "mgmtRsOoBStNode"
  content = {
    addr   = var.ip
    gw     = var.gateway
    v6Addr = var.v6_ip
    v6Gw   = var.v6_gateway
    tDn    = "topology/pod-${var.pod_id}/node-${var.node_id}"
  }
}
