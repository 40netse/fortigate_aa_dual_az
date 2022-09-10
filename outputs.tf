

output "_1_fgt1_login_info" {
  description = "Fortigate 1 login URL"
  value = "fgt1 login url: https://${element(module.fortigate_1.public_eip, 0)}"
}
output "_2_fgt2_login_info" {
  description = "Fortigate 2 login URL"
  value = "fgt2 login url: https://${element(module.fortigate_2.public_eip, 0)}"

}
output "_3_east_instance_login_info" {
  description = "SSH login to Fortigate AZ1"
  value = "ssh -i ${var.keypair} admin@${element(module.fortigate_1.public_eip, 0)}"

}
output "_4_west_instance_login_info" {
  description = "SSH login to Fortigate AZ2"
  value = "ssh -i ${var.keypair} admin@${element(module.fortigate_2.public_eip, 0)}"

}
output "_5_east_instance_login_info" {
  description = "SSH login to East instance"
  value = "ssh -i ${var.keypair} ubuntu@${element(module.fortigate_1.public_eip, 0)} -p 2222"

}
output "_6_west_instance_login_info" {
  description = "SSH login to West instance"
  value = "ssh -i ${var.keypair} ubuntu@${element(module.fortigate_2.public_eip, 0)} -p 2223"

}
/*
output "public_nlb_test_urls" {
  value = <<-NLBURL
  # nlb app1 url - provides fixed content from the spoke1 web servers through the security stack
  http://${element(module.spoke1-vpc-public-nlb.nlb_dns, 0)}/app1/index.html
  # nlb app2 url - provides fixed content from the spoke2 web servers through the security stack
  http://${element(module.spoke2-vpc-public-nlb.nlb_dns, 0)}/app2/index.html
  NLBURL
}

output "web_server_login_info" {
  value = <<-WEBLOGIN
  # spoke1_web1 SSH info: ssh -i ${var.keypair} ubuntu@${module.spoke1-web1.web_eip}
  # spoke1_web2 SSH info: ssh -i ${var.keypair} ubuntu@${module.spoke1-web2.web_eip}
  # spoke2_web1 SSH info: ssh -i ${var.keypair} ubuntu@${module.spoke2-web1.web_eip}
  # spoke2_web2 SSH info: ssh -i ${var.keypair} ubuntu@${module.spoke2-web2.web_eip}
  WEBLOGIN
}

output "tgw_info" {
  value = <<-TGWINFO
  # tgw id: ${module.transit-gw.tgw_id}
  # tgw spoke route table id: ${module.transit-gw.tgw_spoke_route_table_id}
  # tgw security route table id: ${module.transit-gw.tgw_security_route_table_id}
  TGWINFO
}

output "gwlb_info" {
  value = <<-GWLBINFO
  # gwlb arn_suffix: ${element(module.security-vpc-gwlb.gwlb_arn_suffix, 0)}
  # gwlb service_name : ${module.security-vpc-gwlb.gwlb_endpoint_service_name}
  # gwlb service_type : ${module.security-vpc-gwlb.gwlb_endpoint_service_type}
  # gwlb gwlb_ip1 : ${element(module.security-vpc-gwlb.gwlb_ip1, 0)}
  # gwlb gwlb_ip2 : ${element(module.security-vpc-gwlb.gwlb_ip2, 0)}
  GWLBINFO
}
*/