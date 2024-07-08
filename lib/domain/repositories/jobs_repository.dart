import 'package:devlogs_flutter_xchange/domain/failures/fetch_jobs_failure.dart';
import 'package:devlogs_flutter_xchange/domain/entities/job.dart';
import 'package:fpdart/fpdart.dart';

abstract class JobsRepository {
  Future<Either<FetchJobsFailure, List<Job>>> fetchJobs();
}
