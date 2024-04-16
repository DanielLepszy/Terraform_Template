include {
    path = find_in_parent_folders()
}
terraform {
    source ="${get_path_to_repo_root()}//Modules/gcp-gcs"
}
locals{
    skip_vars = jsondecode(file("${get_path_to_repo_root}"/json_tf_vars.json))
    skip = tobool(lookup(local.skip_vars,"skip_gcs_buckets",true))    
}

inputs = {
    project = get_env("GCP_PROJECT","")

    bucket = [
        {
            bucket_name = "${get_env("GCP_PROJECT","")}-1"
        },
        {
            bucket_name = "${get_env("GCP_PROJECT","")}-2"
        }
    ]
}

skip = local.skip