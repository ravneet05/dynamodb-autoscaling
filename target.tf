resource "null_resource" "Scalable_Target_write" {
   provisioner "local-exec" {
    command = "aws application-autoscaling register-scalable-target --service-namespace dynamodb --resource-id 'table/${var.table_name}' --scalable-dimension 'dynamodb:table:WriteCapacityUnits' --min-capacity 5 --max-capacity 15 --role-arn ${aws_iam_role.ddb-role.arn}"
    }
  }  

resource "null_resource" "Scaling_Policy_write" {
  provisioner "local-exec" {
    command = "aws application-autoscaling put-scaling-policy --service-namespace dynamodb --resource-id 'table/${var.table_name}' --scalable-dimension 'dynamodb:table:WriteCapacityUnits' --policy-name 'MyScalingPolicy' --policy-type 'TargetTrackingScaling' --target-tracking-scaling-policy-configuration file://writescalingpolicy.json"
  }
}

resource "null_resource" "Scalable_Target_read" { 
 provisioner "local-exec" {
    command = "aws application-autoscaling register-scalable-target --service-namespace dynamodb --resource-id 'table/${var.table_name}' --scalable-dimension 'dynamodb:table:ReadCapacityUnits' --min-capacity 5 --max-capacity 15 --role-arn ${aws_iam_role.ddb-role.arn}"
  }
}

resource "null_resource" "Scaling_Policy_read" {
  provisioner "local-exec" {
    command = "aws application-autoscaling put-scaling-policy --service-namespace dynamodb --resource-id 'table/${var.table_name}' --scalable-dimension 'dynamodb:table:ReadCapacityUnits' --policy-name 'MyScalingPolicy' --policy-type 'TargetTrackingScaling' --target-tracking-scaling-policy-configuration file://readscalingpolicy.json"
  }
}

