# Create helm_release

resource "helm_release" "django" {
  name             = var.helm_release_name
  chart            = var.chart_path
  namespace        = var._release_namespace
  max_history      = var.maxhistory
  wait             = var.wait
  lint             = var.lint
  reset_values     = var.reset_values
  create_namespace = var.create_namespace
}
