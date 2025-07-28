# A home-manager configuration for Git
{
    ...
}: {
  programs.git = {
    enable = true;

    # Set the global user name and email for Git commits
    userName = "Ahren Stevens-Taylor";
    userEmail = "git@stevenstaylor.dev";
  };
}