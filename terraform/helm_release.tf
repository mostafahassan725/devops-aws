# Create helm_release

resource "helm_release" "django" {
  name             = var.helm_release_name
  chart            = var.chart_path
  namespace        = var._release_namespace
  max_history      = var.maxhistory
  wait             = true
  lint             = true
  reset_values     = true
  create_namespace = true
}
