import 'package:devlogs_flutter_xchange/domain/failures/fetch_jobs_failure.dart';
import 'package:devlogs_flutter_xchange/domain/entities/job.dart';
import 'package:fpdart/fpdart.dart';

import '../domain/repositories/jobs_repository.dart';

class MockJobsRepository implements JobsRepository {
  @override
  Future<Either<FetchJobsFailure, List<Job>>> fetchJobs() async {
    return right(
      [
        Job(
          title: 'Senior Flutter Engineer',
          companyName: 'Flutter Xchange',
        ),
        Job(
          title: 'Senior Go Engineer',
          companyName: 'Flutter Xchange',
        ),
        Job(
          title: 'Senior BE Engineer',
          companyName: 'Flutter Xchange',
        ),
      ],
    );
  }
}
