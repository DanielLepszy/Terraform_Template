# TERRAGRUNT CONFIGURATION
remote_state {
    backend = "gcs"
    generate = {
        path = "backend.tf"
        if_exist = "overwrite"
    }
    config = {
        project = get_env("GCP_PROJECT","")
        location = get_env("REGION","")
        bucket = "${get_env("GCP_PROJECT","")}-tfstate"
        prefix = "${get_env("ENVIRONMENT_NAME","")}/${get_env("PROJECT_NAME","")}/${get_env("REGION","")}/${path_relative_to_include()}"
    }
}

# GLOBAL PARAMETERS
inputs = {
    project = get_env("GCP_PROJECT","")
    region = get_env("REGION","")
    env = get_env("ENVIRONMENT_NAME","")
}
