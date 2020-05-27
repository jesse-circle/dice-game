module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = var.aws_cluster_name
  subnets      = module.vpc.private_subnets

  /*tags = {
    // Check CCIT requirements
  }*/

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "${var.resource_prefix}-worker-group-1"
      instance_type                 = "t2.small"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt.id]
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}