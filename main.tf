# Workaround to create out-of-band EPG in case it does not exist yet, but avoid deleting it when the module is destroyed
resource "aci_rest_managed" "mgmtRsOoBStNode" {
  dn         = "uni/tn-mgmt/mgmtp-default/oob-${var.endpoint_group}/rsooBStNode-[topology/pod-${var.pod_id}/node-${var.node_id}]"
  class_name = "mgmtRsOoBStNode"
  content = {
    addr   = var.ip
    gw     = var.gateway
    v6Addr = var.v6_ip
    v6Gw   = var.v6_gateway
    tDn    = "topology/pod-${var.pod_id}/node-${var.node_id}"
  }
}
