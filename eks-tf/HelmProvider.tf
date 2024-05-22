data "aws_eks_cluster" "eks" {
  name = "demo"

  depends_on = [aws_eks_cluster.demo]
}

data "aws_eks_cluster_auth" "eks" {
  name = "demo"

  depends_on = [aws_eks_cluster.demo]
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}