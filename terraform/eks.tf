


#creates the cluster
resource "aws_eks_cluster" "terraform_cluster" {
    name     = "terraform-cluster"
    role_arn = aws_iam_role.eks_master_role.arn
    version = null

    vpc_config {
        security_group_ids = [aws_security_group.terraform_security_group.id]
        subnet_ids = [aws_subnet.terraform-subnet-1.id, aws_subnet.terraform-subnet-2.id]
    }

    
    # Enable EKS Cluster Control Plane Logging
    enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

    # Ensure that IAM Role permissions are created 
    depends_on = [
        aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
    ]
}


# Create AWS EKS Node Group - Public
resource "aws_eks_node_group" "eks_ng_public" {
  cluster_name    = aws_eks_cluster.terraform_cluster.name

  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = [aws_subnet.terraform-subnet-1.id , aws_subnet.terraform-subnet-2.id]
  
  ami_type = "AL2_x86_64"  
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t2.micro"]
  
  
#   remote_access {
#     ec2_ssh_key = "srevm-key"
#   }

  scaling_config {
    desired_size = 3
    min_size     = 3    
    max_size     = 3
  }

  # Desired max percentage of unavailable worker nodes during node group update.
  update_config {
    max_unavailable = 1    
  }

  # Ensure that IAM Role permissions are created.

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ] 

  tags = {
    Name = "Public-Node-Group"
  }
}

# data "aws_eks_cluster" "cluster" {
#     name = module.eks.cluster_id
# }

# data "aws_eks_cluster_auth" "cluster" {
#     name = module.eks.cluster_id
# }
