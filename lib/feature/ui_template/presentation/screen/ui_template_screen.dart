import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_service/network/constant/enums.dart';
import 'package:network_service/network/failure_state.dart';
import 'package:record_keeping/core/extensions/build_context_extension.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/routing/route_name.dart';

import '../../../../common/widget/text/heading_text_widget.dart';
import '../../../../common/widget/text/normal_text_widget.dart';
import '../../../../common/widget/title_description_with_image_widget.dart';
import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/enums/sociair_enums.dart';
import '../../../../core/localization/l10.dart';
import '../../../../core/localization/language_cubit.dart';
import '../../../../core/network/base_api_request.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/typedef/sociair_type_def.dart';
import '../widget/auto_complete_textfield.dart';
import '../widget/text_field_widget.dart';

class UITemplateScreen extends StatelessWidget {
  const UITemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingTextWidget(
          title: 'Sociair',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              getIt<NavigationService>()
                  .pushReplacementNamed(RouteName.screenDRoute);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            icon: const Icon(Icons.sunny),
            onPressed: () {
              getIt<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: CustomScrollView(
          shrinkWrap: true,
          primary: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  defaultVerticalSpace,
                  const NormalTextWidget(
                    text: 'Click Here For Api Request Sample',
                  ).padHorizontal().onTap(
                    () async {
                      DynamicFailure responseData =
                          await getIt<BaseApiRequest>().getResponse(
                        endPoint: '',
                        apiMethods: ApiMethods.get,
                        unAuthorizedCallBack: () {},
                        isToCache: false,
                      );
                      responseData.fold((Response<dynamic> l) {
                        context.showToastMessage(
                          toastEnum: ToastEnum.success,
                          toastMessage: l.toString(),
                        );
                        log('status code from l: $l');
                      }, (FailureState r) {
                        context.showToastMessage(
                          toastEnum: ToastEnum.error,
                          toastMessage: 'Failure : ${r.message}',
                        );
                        log('status code from r: ${r.statusCode}');
                      });
                    },
                  ),
                  defaultVerticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const NormalTextWidget(
                              text: 'Click Here To Toggle Language')
                          .onTap(() {
                        getIt<LanguageCubit>().toggleLanguage();
                      }),
                      defaultHorizontalSpace,
                      NormalTextWidget(text: l10.hi),
                    ],
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TitleDescriptionWithImageWidget(
                    title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                    description: 'The Shiksshak Sewa Aayog'
                        ' (TSC Teacher Service Commission) is'
                        'responsible for conducting competitive exams for the '
                        'permanent teacher post in government schools. Ambition'
                        'Guru provides online preparation classes for '
                        'the competitive Shishak',
                    isBorderRequired: false,
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TitleDescriptionWithImageWidget(
                    title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                    description: 'The Shiksshak Sewa Aayog'
                        ' (TSC Teacher Service Commission) is'
                        'responsible for conducting competitive exams for the '
                        'permanent teacher post in government schools. Ambition'
                        'Guru provides online preparation classes for '
                        'the competitive Shishak',
                    isToDisplayImage: false,
                    imageUrl:
                        'https://img.freepik.com/free-photo/landscape-shot-beautiful-cholatse-mountains-body-water-khumbu-nepal_181624-24825.jpg?w=2000&t=st=1712140217~exp=1712140817~hmac=511bfa69758169797999cd19251d757d3aca22a75b6b2189b8d48e37c8b5ab13',
                    isToDisplayImageAtBottom: false,
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TitleDescriptionWithImageWidget(
                    title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                    description: 'The Shiksshak Sewa Aayog'
                        ' (TSC Teacher Service Commission) is'
                        'responsible for conducting competitive exams for the '
                        'permanent teacher post in government schools. Ambition'
                        'Guru provides online preparation classes for '
                        'the competitive Shishak',
                    isToDisplayImage: true,
                    imageUrl:
                        'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                    isToDisplayImageAtBottom: true,
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TitleDescriptionWithImageWidget(
                    title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                    description: 'The Shiksshak Sewa Aayog'
                        ' (TSC Teacher Service Commission) is'
                        'responsible for conducting competitive exams for the '
                        'permanent teacher post in government schools. Ambition'
                        'Guru provides online preparation classes for '
                        'the competitive Shishak',
                    isToDisplayImage: true,
                    imageUrl:
                        'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                    isToDisplayImageAtTop: true,
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TitleDescriptionWithImageWidget(
                    title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                    description: 'The Shiksshak Sewa Aayog'
                        ' (TSC Teacher Service Commission) is'
                        'responsible for conducting competitive exams for the '
                        'permanent teacher post in government schools. Ambition'
                        'Guru provides online preparation classes for '
                        'the competitive Shishak',
                    isToDisplayImage: true,
                    imageUrl:
                        'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                    isToDisplayImageAtTop: true,
                    isBorderRequired: false,
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TitleDescriptionWithImageWidget(
                    title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                    description: 'The Shiksshak Sewa Aayog'
                        ' (TSC Teacher Service Commission) is'
                        'responsible for conducting competitive exams for the '
                        'permanent teacher post in government schools. Ambition'
                        'Guru provides online preparation classes for '
                        'the competitive Shishak',
                    isToDisplayImage: true,
                    imageUrl:
                        'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                    isToDisplayImageAtBottom: true,
                    isBorderRequired: false,
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TitleDescriptionWithImageWidget(
                    title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                    description: 'The Shiksshak Sewa Aayog'
                        ' (TSC Teacher Service Commission) is'
                        'responsible for conducting competitive exams for the '
                        'permanent teacher post in government schools. Ambition'
                        'Guru provides online preparation classes for '
                        'the competitive Shishak',
                    isToDisplayImage: true,
                    imageUrl:
                        'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                    isToDisplayImageAtBottom: true,
                    isBorderRequired: false,
                  ).padHorizontal(),
                  // defaultVerticalSpace,
                  // AuthorListTileWidget(
                  //   authorListTileModel: AuthorListTileModel(
                  //     imageUrl:
                  //         'https://t3.ftcdn.net/jpg/02/65/18/30/360_F_265183061_NkulfPZgRxbNg3rvYSNGGwi0iD7qbmOp.jpg',
                  //     title: 'Jagaran Maharjan',
                  //     description: 'Jan 7, 2024',
                  //   ),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // AuthorListTileWidget(
                  //   authorListTileModel: AuthorListTileModel(
                  //     imageUrl:
                  //         'https://t3.ftcdn.net/jpg/02/65/18/30/360_F_265183061_NkulfPZgRxbNg3rvYSNGGwi0iD7qbmOp.jpg',
                  //     title: 'Jagaran Maharjan',
                  //     description: 'Jan 7, 2024',
                  //     isBorderRequired: true,
                  //   ),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // TitleDescriptionWithImageWidget(
                  //   title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                  //   description: 'The Shiksshak Sewa Aayog'
                  //       ' (TSC Teacher Service Commission) is'
                  //       'responsible for conducting competitive exams for the '
                  //       'permanent teacher post in government schools. Ambition'
                  //       'Guru provides online preparation classes for '
                  //       'the competitive Shishak',
                  //   isToDisplayImage: true,
                  //   imageUrl:
                  //       'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                  //   isToDisplayImageAtBottom: true,
                  //   isBorderRequired: false,
                  //   hasAuthor: true,
                  //   authorListTileModel: AuthorListTileModel(
                  //     imageUrl:
                  //         'https://t3.ftcdn.net/jpg/02/65/18/30/360_F_265183061_NkulfPZgRxbNg3rvYSNGGwi0iD7qbmOp.jpg',
                  //     title: 'Jagaran Maharjan',
                  //     description: 'Jan 7, 2024',
                  //     removeAuthorImagePadding: true,
                  //   ),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // TitleDescriptionWithImageWidget(
                  //   title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                  //   description: 'The Shiksshak Sewa Aayog'
                  //       ' (TSC Teacher Service Commission) is'
                  //       'responsible for conducting competitive exams for the '
                  //       'permanent teacher post in government schools. Ambition'
                  //       'Guru provides online preparation classes for '
                  //       'the competitive Shishak',
                  //   isToDisplayImage: true,
                  //   imageUrl:
                  //       'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                  //   isToDisplayImageAtBottom: true,
                  //   isBorderRequired: true,
                  //   hasAuthor: true,
                  //   authorListTileModel: AuthorListTileModel(
                  //     imageUrl:
                  //         'https://t3.ftcdn.net/jpg/02/65/18/30/360_F_265183061_NkulfPZgRxbNg3rvYSNGGwi0iD7qbmOp.jpg',
                  //     title: 'Jagaran Maharjan',
                  //     description: 'Jan 7, 2024',
                  //     removeAuthorImagePadding: true,
                  //   ),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // TitleDescriptionWithImageWidget(
                  //   title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                  //   description: 'The Shiksshak Sewa Aayog'
                  //       ' (TSC Teacher Service Commission) is'
                  //       'responsible for conducting competitive exams for the '
                  //       'permanent teacher post in government schools. Ambition'
                  //       'Guru provides online preparation classes for '
                  //       'the competitive Shishak',
                  //   isToDisplayImage: false,
                  //   imageUrl:
                  //       'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                  //   isToDisplayImageAtBottom: false,
                  //   isBorderRequired: false,
                  //   hasAuthor: true,
                  //   authorListTileModel: AuthorListTileModel(
                  //     imageUrl:
                  //         'https://t3.ftcdn.net/jpg/02/65/18/30/360_F_265183061_NkulfPZgRxbNg3rvYSNGGwi0iD7qbmOp.jpg',
                  //     title: 'Jagaran Maharjan',
                  //     description: 'Jan 7, 2024',
                  //     removeAuthorImagePadding: true,
                  //   ),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // TitleDescriptionWithImageWidget(
                  //   title: 'How to Buy Ambition Guru’s  Shikshak Sewa Course?',
                  //   description: 'The Shiksshak Sewa Aayog'
                  //       ' (TSC Teacher Service Commission) is'
                  //       'responsible for conducting competitive exams for the '
                  //       'permanent teacher post in government schools. Ambition'
                  //       'Guru provides online preparation classes for '
                  //       'the competitive Shishak',
                  //   isToDisplayImage: false,
                  //   imageUrl:
                  //       'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                  //   isToDisplayImageAtBottom: false,
                  //   isBorderRequired: true,
                  //   hasAuthor: true,
                  //   authorListTileModel: AuthorListTileModel(
                  //     imageUrl:
                  //         'https://t3.ftcdn.net/jpg/02/65/18/30/360_F_265183061_NkulfPZgRxbNg3rvYSNGGwi0iD7qbmOp.jpg',
                  //     title: 'Jagaran Maharjan',
                  //     description: 'Jan 7, 2024',
                  //     removeAuthorImagePadding: true,
                  //   ),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: ValueHighLightWidget(
                  //         value: '80',
                  //         label: 'Total Message',
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: ValueHighLightWidget(
                  //         value: '80',
                  //         label: 'Total Message',
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: ValueHighLightWidget(
                  //         value: '80',
                  //         label: 'Total Message',
                  //       ),
                  //     ),
                  //   ],
                  // ).padHorizontal().padTop(),
                  // defaultVerticalSpace,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     const Expanded(
                  //       child: ValueHighLightWidget(
                  //         value: '80',
                  //         label: 'Total Message',
                  //         isBorderRequired: true,
                  //       ),
                  //     ),
                  //     5.horizontalSpace,
                  //     const Expanded(
                  //       child: ValueHighLightWidget(
                  //         value: '80',
                  //         label: 'Total Message',
                  //         isBorderRequired: true,
                  //       ),
                  //     ),
                  //     5.horizontalSpace,
                  //     const Expanded(
                  //       child: ValueHighLightWidget(
                  //         value: '80',
                  //         label: 'Total Message',
                  //         isBorderRequired: true,
                  //       ),
                  //     ),
                  //   ],
                  // ).padHorizontal().padVertical(),
                  // defaultVerticalSpace,
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(
                  //         Radius.circular(kDefaultBorderRadius)),
                  //     border: Border.all(
                  //       width: kDefaultBorderWidth,
                  //       color: getColorByTheme(
                  //         context: context,
                  //         colorClass: AppColors.borderColor,
                  //       ),
                  //     ),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       const HeadingTextWidget(title: 'No Daily Update'),
                  //       defaultVerticalSpace,
                  //       AuthorListTileWidget(
                  //         authorListTileModel: AuthorListTileModel(
                  //           title: 'Jagaran Maharjan',
                  //           imageUrl: '',
                  //           trailingValue: '30',
                  //           isToDisplayAuthor: false,
                  //           hasValueOnTrailing: true,
                  //           removeAuthorImagePadding: true,
                  //         ),
                  //       ),
                  //       Divider(
                  //         color: Colors.grey.withOpacity(0.13),
                  //         thickness: 1,
                  //       ),
                  //       AuthorListTileWidget(
                  //         authorListTileModel: AuthorListTileModel(
                  //           title: 'Jagaran Maharjan',
                  //           imageUrl: '',
                  //           trailingValue: '30',
                  //           isToDisplayAuthor: false,
                  //           hasValueOnTrailing: true,
                  //           removeAuthorImagePadding: true,
                  //         ),
                  //       ),
                  //       Divider(
                  //         color: Colors.grey.withOpacity(0.13),
                  //         thickness: 1,
                  //       ),
                  //       AuthorListTileWidget(
                  //         authorListTileModel: AuthorListTileModel(
                  //           title: 'Jagaran Maharjan',
                  //           imageUrl: '',
                  //           trailingValue: '30',
                  //           isToDisplayAuthor: false,
                  //           hasValueOnTrailing: true,
                  //           removeAuthorImagePadding: true,
                  //         ),
                  //       ),
                  //     ],
                  //   ).padAll(),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // Container(
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius:
                  //   //   BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
                  //   //   border: Border.all(
                  //   //     width: kDefaultBorderWidth,
                  //   //     color: getColorByTheme(
                  //   //       context: context,
                  //   //       colorClass: AppColors.borderColor,
                  //   //     ),
                  //   //   ),
                  //   // ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       const HeadingTextWidget(title: 'Subordinate Progress'),
                  //       defaultVerticalSpace,
                  //       AuthorListTileWidget(
                  //         authorListTileModel: AuthorListTileModel(
                  //           title: 'Jagaran Maharjan',
                  //           description: "What's your name brother?",
                  //           imageUrl: '',
                  //           trailingValue: '30',
                  //           isToDisplayAuthor: false,
                  //           hasValueOnTrailing: true,
                  //           removeAuthorImagePadding: true,
                  //         ),
                  //       ),
                  //       Divider(
                  //         color: Colors.grey.withOpacity(0.13),
                  //         thickness: 1,
                  //       ),
                  //       AuthorListTileWidget(
                  //         authorListTileModel: AuthorListTileModel(
                  //           title: 'Jagaran Maharjan',
                  //           description: "What's your name brother?",
                  //           imageUrl: '',
                  //           trailingValue: '30',
                  //           isToDisplayAuthor: false,
                  //           hasValueOnTrailing: true,
                  //           removeAuthorImagePadding: true,
                  //         ),
                  //       ),
                  //       Divider(
                  //         color: Colors.grey.withOpacity(0.13),
                  //         thickness: 1,
                  //       ),
                  //       AuthorListTileWidget(
                  //         authorListTileModel: AuthorListTileModel(
                  //           title: 'Jagaran Maharjan',
                  //           description: "What's your name brother?",
                  //           imageUrl: '',
                  //           trailingValue: '30',
                  //           isToDisplayAuthor: false,
                  //           hasValueOnTrailing: true,
                  //           removeAuthorImagePadding: true,
                  //         ),
                  //       ),
                  //     ],
                  //   ).padAll(),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // TabBarWidget(
                  //   tabItems: <TabBarModel>[
                  //     TabBarModel(
                  //       title: 'Tab 1',
                  //       slug: 'tab 1',
                  //       rank: 0,
                  //     ),
                  //     TabBarModel(title: 'Tab 2', slug: 'tab 2', rank: 0),
                  //     TabBarModel(title: 'Tab 3', slug: 'tab 3', rank: 0),
                  //     TabBarModel(title: 'Tab 4', slug: 'tab 4', rank: 0),
                  //     TabBarModel(title: 'Tab 5', slug: 'tab 5', rank: 0),
                  //   ],
                  //   tabType: TabType.normal,
                  //   dividerColor: ColorModel(
                  //     lightModeColor: Colors.black,
                  //     darkModeColor: Colors.white,
                  //   ),
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  // TabBarWidget(
                  //   tabItems: <TabBarModel>[
                  //     TabBarModel(title: 'Tab 1', slug: 'tab 1', rank: 0),
                  //     TabBarModel(title: 'Tab 2', slug: 'tab 2', rank: 0),
                  //     TabBarModel(title: 'Tab 3', slug: 'tab 3', rank: 0),
                  //     TabBarModel(title: 'Tab 4', slug: 'tab 4', rank: 0),
                  //     TabBarModel(title: 'Tab 5', slug: 'tab 5', rank: 0),
                  //   ],
                  //   tabType: TabType.box,
                  //   backgroundColor: ColorModel(
                  //     lightModeColor: Colors.black,
                  //     darkModeColor: Colors.white,
                  //   ),
                  //   borderColor: ColorModel(
                  //     lightModeColor: Colors.grey,
                  //     darkModeColor: Colors.grey,
                  //   ),
                  //   fontColor: ColorModel(
                  //     lightModeColor: Colors.grey,
                  //     darkModeColor: Colors.grey,
                  //   ),
                  //   selectedFontColor: ColorModel(
                  //     lightModeColor: Colors.white,
                  //     darkModeColor: Colors.black,
                  //   ),
                  //   selectedBorderColor: ColorModel(
                  //     lightModeColor: Colors.black,
                  //     darkModeColor: Colors.black,
                  //   ),
                  //   selectedTabIndex: 3,
                  // ).padHorizontal(),
                  // defaultVerticalSpace,
                  AppBar(title: const SearchBar()),
                  defaultVerticalSpace,
                  AutocompleteTextField(
                    items: countries,
                    onItemSelect: (String value) {},
                  ).padHorizontal(),
                  defaultVerticalSpace,
                  const TextFieldWidget(
                    hintText: 'Enter your password',
                    isPassword: true,
                  ).padHorizontal(),
                  100.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (!_isActive)
          Text('App bar with search',
              style: Theme.of(context).appBarTheme.titleTextStyle),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActive
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for something',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isActive = false;
                                  });
                                },
                                icon: const Icon(Icons.close))),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isActive = true;
                        });
                      },
                      icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}
