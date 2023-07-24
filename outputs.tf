/* output "spoke10_vm_server_instance_id" {
    value = aws_instance.spoke10_vm01.id
}

output "spoke10_vm_server_instance_public_dns" {
    value = aws_instance.spoke10_vm01.public_dns
} */

output "spoke10_vm_server_instance_public_ip" {
    value = "ssh -i spoke_10_key_pair.pem ubuntu@${aws_eip.spoke10_vm_eip.public_ip}"
}

/* output "spoke10_vm_server_instance_private_ip" {
    value = aws_instance.spoke10_vm01.private_ip
} */

output "spoke20_vm_server_instance_public_ip" {
    value = "ssh -i spoke_20_key_pair.pem ubuntu@${aws_eip.spoke20_vm_eip.public_ip}"
}