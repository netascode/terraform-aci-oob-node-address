<!-- BEGIN_TF_DOCS -->
# OOB Node Address Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

```hcl
module "aci_oob_node_address" {
  source  = "netascode/oob-node-address/aci"
  version = ">= 0.0.2"

  node_id        = 111
  pod_id         = 2
  ip             = "100.1.1.111/24"
  gateway        = "100.1.1.254"
  endpoint_group = "OOB1"
}

```
<!-- END_TF_DOCS -->