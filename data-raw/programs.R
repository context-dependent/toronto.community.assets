## code to prepare `programs` dataset goes here
library(tidyverse)

d0 <- read_csv("data-raw/211-community-assets.csv", show_col_types = FALSE)


programs <- d0 |> 
  janitor::clean_names() |> 
  mutate(
    public_name_modified = public_name |> 
      str_replace_all(
        "Ontario. Ministry of (Children, |)Community and Social Services( - |\\. )", 
        "MCCSS: "
      ) |> 
      str_replace_all(
        "^.*Ontario Disability Support Program.*$", 
        "Ontario Disability Support Program (ODSP)"
      ) |> 
      str_replace_all(
        "Ontario. Ministry of Labour, Training and Skills Development( - |\\. )", 
        "MLTSD: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of Health - ", 
        "Min. of Health: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of Economic Development, Job Creation and Trade. ", 
        "MEDJCT: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of Heritage, Sport, Tourism and Culture [Ii]ndustries(\\. | - )", 
        "MHSTCI: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of Municipal Affairs and Housing. ", 
        "MMAH: "
      ) |> 
      str_replace_all(
        "Ontario. *Ministry of the Attorney General(\\. | - |, Court Services - |, Hamilton Services - )", 
        "MAG: "
      ) |>
      str_replace_all(
        "Ontario. Ministry of Education(\\. | - )", 
        "Min. of Education: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of the Solicitor General - ",
        "SolGen: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of Transportation - ",
        "Min. of Transportation: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of the Environment , Conservation and Parks - ", 
        "Min. of Environment: "
      ) |> 
      str_replace_all(
        "Ontario. Ministry of Infrastructure - ", 
        "Min. of Infrastructure: "
      ) |>
      str_replace_all(
        "Ontario. Ministry for Seniors and Accessibility - ", 
        "MSA: "
      ) |>
      str_replace_all(
        "Ontario. Ministry of Francophone Affairs - ", 
        "MFA: "
      ) |>
      str_replace_all(
        "Ontario. Ministry of Government and Consumer Services. Consumer Protection Ontario", 
        "MGCS: Consumer Protection Ontario"
      ) |>
      str_replace_all(
        "Toronto. Employment and Social Services - ", 
        "TESS: "
      ) |> 
      str_replace_all(
        ".*Ontario Works.*$", 
        "Ontario Works (OW)"
      ) |> 
      str_replace_all(
        "Probation and Parole.*$", 
        "Probation and Parole"
      ) |> 
      str_replace_all(
        "Court of Justice.*$", 
        "Court of Justice"
      ) |> 
      str_replace_all(
        "Victim / Witness Assistance Program.*", 
        "Victim / Witness Assistance Program"
      ) |> 
      str_replace_all(" +", " "),
    org_name = case_when(
      public_name_modified |> str_detect(" - ") ~ str_extract(public_name_modified, r"(^.*?(?= -))"), 
      TRUE ~ public_name_modified
    ) |> 
    str_remove(r"( \[Child care\])")
  )  |> 
  select(
    object_id = objectid, 
    resource_agency_num, 
    org_name,
    public_name, 
    public_name_modified, 
    program_type = category,
    program_taxonomy = taxonomy_terms_not_deactivated,
    info_email = email_address_main, 
    contact_name = main_contact_name, 
    contact_title = main_contact_title, 
    contact_email = main_contact_email_address,
    homepage_url = website_address, 
    neighbourhood_name = hood_name, 
    neighbourhood_id = hood_id, 
    latitude, 
    longitude
  )

usethis::use_data(programs, overwrite = TRUE)
