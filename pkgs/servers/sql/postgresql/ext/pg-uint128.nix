{
  lib,
  fetchFromGitHub,
  postgresql,
  postgresqlBuildExtension,
}:
postgresqlBuildExtension (finalAttrs: {
  pname = "pg-uint128";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "pg-uint";
    repo = finalAttrs.pname;
    rev = finalAttrs.version;
    hash = "sha256-iosm/RdiPi4b07rmNK1tDMIgoCIIcDJ9x161B7hTJFc=";
  };

  meta = with lib; {
    description = "A PostgreSQL extension that adds native support for unsigned integers and 128-bit signed/unsigned integer types.";
    homepage = "https://github.com/pg-uint/pg-uint128/";
    changelog = "https://github.com/pg-uint/pg-uint128/releases/tag/${version}";
    maintainers = with maintainers; [coca];
    platforms = postgresql.meta.platforms;
    license = licenses.postgresql;
  };
})
