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
          description: 'Database developer required with 4 years of experience',
          isRemote: false,
          skills: ['flutter', 'iOS', 'Android', 'Xamarin'],
        ),
        Job(
          title: 'Senior Database Engineer',
          companyName: 'Flutter Xchange',
          description: 'Flutter developer required with 4 years of experience',
          isRemote: true,
          skills: ['flutter', 'iOS', 'Android', 'Xamarin'],
        ),
        Job(
          title: 'Senior Product Manager',
          companyName: 'Flutter Xchange',
          description: 'Product Manager required with 4 years of experience',
          isRemote: true,
          skills: ['flutter', 'project management', 'Android', 'Xamarin'],
        ),
      ],
    );
  }
}
