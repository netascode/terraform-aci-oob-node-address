terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  node_id        = 111
  ip             = "100.1.1.111/24"
  gateway        = "100.1.1.254"
  endpoint_group = "OOB1"
}

data "aci_rest" "mgmtRsOoBStNode" {
  dn = "uni/tn-mgmt/mgmtp-default/oob-OOB1/rsooBStNode-[topology/pod-1/node-111]"

  depends_on = [module.main]
}

resource "test_assertions" "mgmtRsOoBStNode" {
  component = "mgmtRsOoBStNode"

  equal "addr" {
    description = "addr"
    got         = data.aci_rest.mgmtRsOoBStNode.content.addr
    want        = "100.1.1.111/24"
  }

  equal "gw" {
    description = "gw"
    got         = data.aci_rest.mgmtRsOoBStNode.content.gw
    want        = "100.1.1.254"
  }

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest.mgmtRsOoBStNode.content.tDn
    want        = "topology/pod-1/node-111"
  }
}
