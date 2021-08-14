module "aci_oob_node_address" {
  source = "netascode/oob-node-address/aci"

  node_id        = 111
  pod            = 2
  address        = "100.1.1.111/24"
  gateway        = "100.1.1.254"
  endpoint_group = "OOB1"
}
