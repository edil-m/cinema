import 'package:cinema/bloc/imbd_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cinema extends StatelessWidget {
  const Cinema({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              BlocProvider.of<ImbdBloc>(context).add(
                SendSearchRequest(cinemaName: value),
              );
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: const Icon(Icons.search_outlined,
                  size: 30, color: Colors.blue),
            ),
          ),
          SizedBox(
            child: BlocBuilder<ImbdBloc, ImbdState>(
              builder: (context, state) {
                if (state is ImbdSucces) {
                  return Column(
                    children: [
                      Text('Title: ${state.model.title}'),
                      Text('Year: ${state.model.year}'),
                      Text('Director: ${state.model.director}'),
                      Image.network(
                        state.model.poster ??
                            'https://miro.medium.com/v2/resize:fit:1100/format:webp/1*JFP3Z2Cg9--FKZ4rlGppew.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  );
                } else if (state is ImbdEvent) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ImbdError) {
                  return Center(
                    child: Image.network(
                        'https://miro.medium.com/v2/resize:fit:1100/format:webp/1*JFP3Z2Cg9--FKZ4rlGppew.png'),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
