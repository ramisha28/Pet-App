import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  FAQPageState createState() => FAQPageState();
}

class FAQPageState extends State<FAQPage> {
  final List<Map<String, String>> _faqs = [
    {
      'question': 'How often should I feed my pet?',
      'answer':
          'It depends on the type of pet. Generally, twice a day is recommended.',
      'type': 'General'
    },
    {
      'question': 'What vaccinations does my pet need?',
      'answer':
          'Consult with your vet for a vaccination schedule specific to your pet.',
      'type': 'General'
    },
    {
      'question': 'How do I groom my pet?',
      'answer':
          'Regular brushing and occasional baths are recommended. Specific grooming needs vary by breed.',
      'type': 'General'
    },
    {
      'question': 'How often should I walk my dog?',
      'answer':
          'Dogs should be walked at least once a day, depending on the breed and age.',
      'type': 'Dog'
    },
    {
      'question': 'What is the best diet for a cat?',
      'answer':
          'Cats need a diet high in protein. Consult your vet for specific recommendations.',
      'type': 'Cat'
    },
    {
      'question': 'How do I train my dog to obey commands?',
      'answer':
          'Consistency and positive reinforcement are key. Start with basic commands like sit and stay.',
      'type': 'Dog'
    },
    {
      'question': 'How can I tell if my fish is healthy?',
      'answer': 'Healthy fish are active, eat well, and have vibrant colors.',
      'type': 'Fish'
    },
    {
      'question': 'What should I feed my parrot?',
      'answer':
          'A balanced diet of seeds, pellets, fruits, and vegetables is ideal.',
      'type': 'Parrot'
    },
    {
      'question': 'How can I keep my rabbit\'s teeth healthy?',
      'answer':
          'Provide chew toys and a diet high in hay to prevent overgrown teeth.',
      'type': 'Rabbit'
    },
    {
      'question': 'What is the lifespan of a hamster?',
      'answer': 'Hamsters generally live 2-3 years.',
      'type': 'Hamster'
    },
    {
      'question': 'How do I set up a habitat for my guinea pig?',
      'answer': 'Provide a spacious cage, bedding, fresh hay, and water.',
      'type': 'Guinea Pig'
    },
    {
      'question': 'What kind of filter do I need for my fish tank?',
      'answer':
          'Choose a filter suitable for the size of your tank and the type of fish you have.',
      'type': 'Fish'
    },
    {
      'question': 'How often should I clean my bird\'s cage?',
      'answer': 'Clean the cage at least once a week, and spot-clean daily.',
      'type': 'Parrot'
    },
    {
      'question': 'What should I do if my dog has fleas?',
      'answer':
          'Use a vet-recommended flea treatment and clean your home thoroughly.',
      'type': 'Dog'
    },
    {
      'question': 'Can cats eat human food?',
      'answer':
          'Some human foods are safe, but avoid toxic foods like chocolate, onions, and garlic.',
      'type': 'Cat'
    },
    {
      'question': 'How do I introduce a new pet to my household?',
      'answer':
          'Introduce them gradually and supervise interactions to ensure safety.',
      'type': 'General'
    },
    {
      'question': 'How much water should my rabbit drink?',
      'answer':
          'Rabbits should always have access to fresh water. They typically drink about 50-150 ml per kg of body weight daily.',
      'type': 'Rabbit'
    },
    {
      'question': 'What is the ideal temperature for a fish tank?',
      'answer':
          'The ideal temperature varies by species but is generally between 75-80°F for tropical fish.',
      'type': 'Fish'
    },
    {
      'question': 'What toys are safe for my parrot?',
      'answer':
          'Provide non-toxic toys made for birds, avoiding those with small parts or sharp edges.',
      'type': 'Parrot'
    },
    {
      'question': 'How often should I bathe my dog?',
      'answer':
          'Dogs should be bathed every 4-6 weeks, or as needed based on activity level and coat type.',
      'type': 'Dog'
    },
    {
      'question': 'How do I prevent my cat from scratching furniture?',
      'answer':
          'Provide scratching posts and pads, and use deterrent sprays on furniture.',
      'type': 'Cat'
    },
    {
      'question': 'What should I do if my pet is overweight?',
      'answer':
          'Consult your vet for a weight loss plan, including diet and exercise.',
      'type': 'General'
    },
    {
      'question': 'How do I clean my dog\'s ears?',
      'answer':
          'Use a vet-recommended ear cleaner and cotton balls. Avoid using cotton swabs.',
      'type': 'Dog'
    },
    {
      'question': 'What is the best bedding for my hamster?',
      'answer':
          'Use paper-based bedding or aspen shavings. Avoid cedar and pine shavings.',
      'type': 'Hamster'
    },
    {
      'question': 'How do I socialize my parrot?',
      'answer':
          'Spend time interacting with your parrot daily, and provide toys and activities.',
      'type': 'Parrot'
    },
    {
      'question': 'How often should I trim my rabbit\'s nails?',
      'answer': 'Trim your rabbit\'s nails every 4-6 weeks, or as needed.',
      'type': 'Rabbit'
    },
    {
      'question': 'What should I feed my guinea pig?',
      'answer':
          'Provide fresh hay, vegetables, and a small amount of pellets. Ensure they get enough vitamin C.',
      'type': 'Guinea Pig'
    },
    {
      'question': 'How do I acclimate new fish to my tank?',
      'answer':
          'Float the bag in the tank for 15-20 minutes, then gradually add tank water to the bag before releasing the fish.',
      'type': 'Fish'
    },
    {
      'question': 'How do I prevent my dog from barking excessively?',
      'answer':
          'Identify the cause of barking and address it. Use positive reinforcement to train your dog to be quiet.',
      'type': 'Dog'
    },
    {
      'question': 'What is the best diet for a goat?',
      'answer':
          'Provide fresh hay, grains, and access to pasture. Ensure they have a mineral supplement.',
      'type': 'Goat'
    },
    {
      'question': 'How do I care for my sheep?',
      'answer':
          'Provide fresh hay, grains, and access to pasture. Ensure they have regular veterinary care and shearing.',
      'type': 'Sheep'
    },
    {
      'question': 'How do I litter train my rabbit?',
      'answer':
          'Place a litter box in their enclosure and encourage them to use it by placing hay in the box.',
      'type': 'Rabbit'
    },
    {
      'question': 'What should I do if my cat is not using the litter box?',
      'answer':
          'Ensure the litter box is clean, in a quiet location, and the right size. Consult your vet if the problem persists.',
      'type': 'Cat'
    },
    {
      'question': 'How do I train my dog to walk on a leash?',
      'answer':
          'Use positive reinforcement and start with short, frequent walks. Gradually increase the duration and distance.',
      'type': 'Dog'
    },
    {
      'question': 'What is the best way to clean my fish tank?',
      'answer':
          'Perform regular water changes, clean the filter, and remove algae from the tank walls.',
      'type': 'Fish'
    },
    {
      'question': 'How do I prevent my parrot from plucking feathers?',
      'answer':
          'Ensure they have a balanced diet, mental stimulation, and regular social interaction. Consult your vet if the problem persists.',
      'type': 'Parrot'
    },
    {
      'question': 'What should I do if my hamster is not eating?',
      'answer':
          'Check their teeth for overgrowth, ensure they have fresh food and water, and consult your vet if the problem persists.',
      'type': 'Hamster'
    },
    {
      'question': 'How do I introduce a new dog to my household?',
      'answer':
          'Introduce them gradually in a neutral location, supervise interactions, and provide separate spaces for each dog initially.',
      'type': 'Dog'
    },
    {
      'question': 'What is the best way to clean my rabbit\'s cage?',
      'answer':
          'Remove soiled bedding daily, and perform a thorough cleaning of the cage weekly.',
      'type': 'Rabbit'
    },
    {
      'question': 'How do I prevent my cat from getting hairballs?',
      'answer':
          'Regular grooming and a diet high in fiber can help prevent hairballs.',
      'type': 'Cat'
    },
    {
      'question': 'What should I do if my guinea pig is not drinking water?',
      'answer':
          'Ensure they have fresh water available, check the water bottle for blockages, and consult your vet if the problem persists.',
      'type': 'Guinea Pig'
    },
    {
      'question': 'How do I care for my goat\'s hooves?',
      'answer':
          'Trim their hooves regularly to prevent overgrowth and infections. Consult your vet for proper trimming techniques.',
      'type': 'Goat'
    },
    {
      'question': 'What is the best way to clean my bird\'s cage?',
      'answer':
          'Remove soiled bedding daily, and perform a thorough cleaning of the cage weekly.',
      'type': 'Parrot'
    },
    {
      'question': 'How do I prevent my dog from chewing on furniture?',
      'answer':
          'Provide chew toys, use deterrent sprays on furniture, and supervise your dog to redirect their chewing behavior.',
      'type': 'Dog'
    },
    {
      'question': 'What should I do if my cat is scratching excessively?',
      'answer':
          'Check for fleas or skin conditions, provide scratching posts, and consult your vet if the problem persists.',
      'type': 'Cat'
    },
    {
      'question': 'How do I socialize my guinea pig?',
      'answer':
          'Spend time interacting with your guinea pig daily, and provide toys and activities to keep them engaged.',
      'type': 'Guinea Pig'
    },
    {
      'question': 'What is the best diet for a sheep?',
      'answer':
          'Provide fresh hay, grains, and access to pasture. Ensure they have a mineral supplement.',
      'type': 'Sheep'
    },
    {
      'question': 'How do I prevent my rabbit from digging?',
      'answer':
          'Provide a digging box or designated area for digging, and supervise your rabbit to redirect their behavior.',
      'type': 'Rabbit'
    },
    {
      'question': 'What should I do if my fish is not eating?',
      'answer':
          'Check the water quality, ensure they have the right type of food, and consult your vet if the problem persists.',
      'type': 'Fish'
    },
    {
      'question': 'How do I train my dog to stop jumping on people?',
      'answer':
          'Use positive reinforcement to reward calm behavior, and teach your dog to sit when greeting people.',
      'type': 'Dog'
    },
    {
      'question': 'What is the best way to clean my cat\'s litter box?',
      'answer':
          'Scoop the litter box daily, and perform a thorough cleaning with soap and water weekly.',
      'type': 'Cat'
    },
    {
      'question': 'How do I prevent my parrot from biting?',
      'answer':
          'Provide mental stimulation, avoid triggering situations, and use positive reinforcement to encourage gentle behavior.',
      'type': 'Parrot'
    },
    {
      'question': 'What should I do if my hamster is not drinking water?',
      'answer':
          'Ensure they have fresh water available, check the water bottle for blockages, and consult your vet if the problem persists.',
      'type': 'Hamster'
    },
    {
      'question': 'How do I introduce a new cat to my household?',
      'answer':
          'Introduce them gradually, provide separate spaces for each cat initially, and supervise interactions to ensure safety.',
      'type': 'Cat'
    },
    {
      'question': 'What is the best way to clean my guinea pig\'s cage?',
      'answer':
          'Remove soiled bedding daily, and perform a thorough cleaning of the cage weekly.',
      'type': 'Guinea Pig'
    },
    {
      'question': 'How do I prevent my dog from digging in the yard?',
      'answer':
          'Provide a designated digging area, supervise your dog, and use positive reinforcement to redirect their behavior.',
      'type': 'Dog'
    },
    {
      'question': 'What should I do if my rabbit is not eating?',
      'answer':
          'Check their teeth for overgrowth, ensure they have fresh food and water, and consult your vet if the problem persists.',
      'type': 'Rabbit'
    },
    {
      'question': 'How do I care for my fish during a power outage?',
      'answer':
          'Use a battery-powered air pump, avoid feeding them, and monitor water temperature closely.',
      'type': 'Fish'
    },
    {
      'question': 'What is the best way to clean my dog\'s teeth?',
      'answer':
          'Use a vet-recommended toothbrush and toothpaste, and provide dental chews and toys.',
      'type': 'Dog'
    },
    {
      'question': 'How do I prevent my cat from spraying?',
      'answer':
          'Ensure they are spayed or neutered, provide multiple litter boxes, and reduce stress in their environment.',
      'type': 'Cat'
    },
    {
      'question': 'What should I do if my parrot is not eating?',
      'answer':
          'Ensure they have fresh food available, check for signs of illness, and consult your vet if the problem persists.',
      'type': 'Parrot'
    },
    {
      'question': 'How do I socialize my rabbit?',
      'answer':
          'Spend time interacting with your rabbit daily, and provide toys and activities to keep them engaged.',
      'type': 'Rabbit'
    },
    {
      'question': 'What is the best diet for a fish?',
      'answer':
          'Provide a balanced diet of flakes, pellets, and occasional live or frozen foods.',
      'type': 'Fish'
    },
    {
      'question': 'How do I prevent my dog from pulling on the leash?',
      'answer':
          'Use positive reinforcement to reward loose-leash walking, and practice regularly with short, frequent walks.',
      'type': 'Dog'
    },
    {
      'question': 'What should I do if my cat is not drinking water?',
      'answer':
          'Ensure they have fresh water available, try different types of water bowls, and consult your vet if the problem persists.',
      'type': 'Cat'
    },
    {
      'question': 'How do I prevent my guinea pig from chewing on cage bars?',
      'answer':
          'Provide chew toys and plenty of hay, and ensure they have enough space and mental stimulation.',
      'type': 'Guinea Pig'
    },
    {
      'question': 'What is the best way to clean my goat\'s pen?',
      'answer':
          'Remove soiled bedding daily, and perform a thorough cleaning of the pen weekly.',
      'type': 'Goat'
    },
    {
      'question': 'How do I prevent my rabbit from chewing on furniture?',
      'answer':
          'Provide chew toys, use deterrent sprays on furniture, and supervise your rabbit to redirect their behavior.',
      'type': 'Rabbit'
    },
    {
      'question': 'What should I do if my fish is swimming erratically?',
      'answer':
          'Check the water quality, ensure they have enough space, and consult your vet if the problem persists.',
      'type': 'Fish'
    },
    {
      'question': 'How do I train my dog to stay?',
      'answer':
          'Use positive reinforcement to reward staying behavior, and practice regularly with short, frequent sessions.',
      'type': 'Dog'
    },
    {
      'question': 'What is the best way to clean my cat\'s ears?',
      'answer':
          'Use a vet-recommended ear cleaner and cotton balls. Avoid using cotton swabs.',
      'type': 'Cat'
    },
    {
      'question': 'How do I prevent my parrot from screaming?',
      'answer':
          'Provide mental stimulation, avoid reinforcing the behavior, and use positive reinforcement to encourage quiet behavior.',
      'type': 'Parrot'
    },
    {
      'question': 'What should I do if my hamster is not active?',
      'answer':
          'Ensure they have enough space and mental stimulation, check for signs of illness, and consult your vet if the problem persists.',
      'type': 'Hamster'
    },
    {
      'question': 'How do I introduce a new rabbit to my household?',
      'answer':
          'Introduce them gradually, provide separate spaces for each rabbit initially, and supervise interactions to ensure safety.',
      'type': 'Rabbit'
    },
    {
      'question':
          'What is the best way to clean my guinea pig\'s water bottle?',
      'answer':
          'Use a bottle brush and mild soap to clean the bottle regularly, and rinse thoroughly before refilling.',
      'type': 'Guinea Pig'
    },
    {
      'question': 'How do I prevent my dog from jumping on furniture?',
      'answer':
          'Provide alternative resting places, use positive reinforcement to reward staying off furniture, and supervise your dog to redirect their behavior.',
      'type': 'Dog'
    },
    {
      'question': 'What should I do if my cat is hiding?',
      'answer':
          'Ensure they have a safe and comfortable environment, provide hiding spots, and consult your vet if the behavior persists.',
      'type': 'Cat'
    },
    {
      'question': 'How do I socialize my parrot?',
      'answer':
          'Spend time interacting with your parrot daily, and provide toys and activities to keep them engaged.',
      'type': 'Parrot'
    },
    {
      'question': 'What is the best diet for a hamster?',
      'answer':
          'Provide a balanced diet of hamster pellets, fresh vegetables, and occasional treats.',
      'type': 'Hamster'
    },
    // ... Add more FAQs ...
  ];

  List<Map<String, String>> _filteredFaqs = [];
  String _searchQuery = '';
  String _selectedType = 'All';

  final List<String> _animalTypes = [
    'All',
    'General',
    'Dog',
    'Cat',
    'Rabbit',
    'Parrot',
    'Hamster',
    'Guinea Pig',
    'Fish',
    'Goat',
    'Sheep'
  ];

  @override
  void initState() {
    super.initState();
    _filteredFaqs = _faqs;
  }

  void _filterFaqs() {
    setState(() {
      _filteredFaqs = _faqs.where((faq) {
        final matchesType =
            _selectedType == 'All' || faq['type'] == _selectedType;
        final matchesQuery = faq['question']!
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            faq['answer']!.toLowerCase().contains(_searchQuery.toLowerCase());
        return matchesType && matchesQuery;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQ')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  _filterFaqs();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: _selectedType,
              items: _animalTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue!;
                  _filterFaqs();
                });
              },
              decoration:
                  const InputDecoration(labelText: 'Select Animal Type'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredFaqs.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(_filteredFaqs[index]['question']!),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(_filteredFaqs[index]['answer']!),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
