import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_crm/app/routes/route_name.dart';
import '../../../data/models/company_model.dart';
import '../../bloc/companies_bloc.dart';
import 'company_card.dart';
import 'company_card_skeleton.dart';

class CompanyListView extends StatefulWidget {
  final List<CompanyModel> companies;
  final bool isLoadingMore;

  const CompanyListView({
    super.key,
    required this.companies,
    required this.isLoadingMore,
  });

  @override
  State<CompanyListView> createState() => _CompanyListViewState();
}

class _CompanyListViewState extends State<CompanyListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<CompaniesBloc>().add(LoadMoreCompaniesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final listLength = widget.companies.length + (widget.isLoadingMore ? 1 : 0);

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: listLength,
      itemBuilder: (context, index) {
        if (index == widget.companies.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CompanyCardSkeleton(),
          );
        }
        final company = widget.companies[index];
        return CompanyCard(
          company: company,
          onTap: () {
            context.push(RouteNames.companyDetails, extra: company);
          },
        );
      },
    );
  }
}
