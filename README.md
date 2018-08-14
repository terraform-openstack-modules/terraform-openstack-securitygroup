# Objetivo
Este módulo tem por objetivo o reaproveitamento do código e a padronização no provisionamento de volumes para instâncias no Openstack.

## Requisitos
Foram considerados os seguintes itens para a construção de security group:
<pre>
<b>1. Name</b>
   1.1. Nome do security group.
<b>2. Description</b>
   2.1. Descrição do security group.
<b>3. Rules</b>
   3.1. Lista das regras pertinentes ao security group. 
        Recomenda-se em utilizar uma variável que receba a lista de regras.
</pre>   

## Exemplos
### Definição de um security group
<pre>
<b>module "instance-sg" </b>{
  source      = "terraform-openstack-modules/securitygroup/openstack"
  version     = "0.0.1"
  name        = "instance-sg"
  description = "Instance Rules Project"
  rules       = <b>"${var.instance-rules-sg}"</b>
}

<b>variable "instance-rules-sg"</b> {
  default = [
    {
      direction         = "ingress"
      ethertype         = "IPv4"
      protocol          = "tcp"
      port_range_min    = 22
      port_range_max    = 22
      remote_ip_prefix  = "0.0.0.0/0"
    },
    {
      direction         = "ingress"
      ethertype         = "IPv4"
      protocol          = "icmp"
      port_range_min    = 0
      port_range_max    = 0
      remote_ip_prefix  = "0.0.0.0/0"
    }
 ]
}
</pre>
