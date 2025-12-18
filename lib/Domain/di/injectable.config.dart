// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sports_venues/Application/Venue/bloc/venue_bloc.dart' as _i893;
import 'package:sports_venues/Data/API/venue_repo.dart' as _i117;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i893.VenueBloc>(() => _i893.VenueBloc());
    gh.lazySingleton<_i117.VenueRepo>(() => _i117.VenueRepo());
    return this;
  }
}
