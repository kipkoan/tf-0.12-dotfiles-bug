module "tf_dotfiles_1" {
  # change .terraform-version file for tfenv to use tf v0.11.14 or v0.12.9

  # local source: WORKS in tf 0.11.14
  # local source: WORKS in tf 0.12.9 - modules.json sets module dir to parent path
  # source = "../../modules/tf_dotfiles"

  # local source using git sha: WORKS in tf 0.11.14
  # local source using git sha: DOES NOT WORK in tf 0.12.9 - local git source not supported
  # source = "git::../..//modules/tf_dotfiles?ref=a8bdfcc3a46"

  # remote source: WORKS in tf 0.11.14
  # remote source: DOES NOT WORK in tf 0.12.9 - 2nd module has no dotfile included
  source = "git@github.com:kipkoan/tf-0.12-dotfiles-bug.git//modules/tf_dotfiles"

  # remote source using git sha: WORKS in tf 0.11.14
  # remote source using git sha: DOES NOT WORK in tf 0.12.9 - 2nd module has no dotfile included
  # source = "git@github.com:kipkoan/tf-0.12-dotfiles-bug.git//modules/tf_dotfiles?ref=a8bdfcc3a46"
}

module "tf_dotfiles_2" {
  # use the corresponding source line from module tf_dotfiles_1 above

  # source = "../../modules/tf_dotfiles"
  # source = "git::../..//modules/tf_dotfiles?ref=a8bdfcc3a46"
  source = "git@github.com:kipkoan/tf-0.12-dotfiles-bug.git//modules/tf_dotfiles"
  # source = "git@github.com:kipkoan/tf-0.12-dotfiles-bug.git//modules/tf_dotfiles?ref=a8bdfcc3a46"
}
