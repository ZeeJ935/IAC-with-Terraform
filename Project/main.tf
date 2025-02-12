module "network" {
  source = "./network"
}

module "keypair" {
  source = "./keypair"
}

module "securitygroups" {
  source = "./securitygroups"

  vpc_ids = module.network.vpc_ids
}

module "ec2" {
  source = "./ec2"

  subnet_ids         = [module.network.subnet_id1, module.network.subnet_id2]
  key_name            = module.keypair.key_name
  security_group_ids  = [module.securitygroups.security_group_id]
}

module "loadbalancer" {
  source = "./loadbalancer"

  subnet_ids = [module.network.subnet_id1, module.network.subnet_id2]
  security_group_ids = [module.securitygroups.security_group_id]
}

module "targetgroup" {
  source = "./targetgroup"

  vpc_ids = module.network.vpc_ids
}

module "listener" {
  source = "./listener"

  lb_id = module.loadbalancer.lb_id
  tg_id = module.targetgroup.tg_id
}

module "s3" {
  source = "./s3"
}

module "iam" {
  source = "./iam"
}

module "ami" {
  source = "./ami"

  ec2_id = module.ec2.ec2_id
  key_name = module.keypair.key_name
}

module "cloudwatch" {
  source = "./cloudwatch"

  ec2_id = module.ec2.ec2_id
}

module "autoscaling" {
  source = "./autoscaling"

  subnet_ids         = [module.network.subnet_id1, module.network.subnet_id2]
  key_name            = module.keypair.key_name
  security_group_ids  = [module.securitygroups.security_group_id]
}

module "alarm" {
  source = "./alarm"

  scale_out_policy_arn = module.autoscaling.scale_out_policy_arn
  scale_in_policy_arn  = module.autoscaling.scale_in_policy_arn
}

module "cloudtrail" {
  source = "./cloudtrail"
}