//
//  ViewController.swift
//  UIKitMarathon_D8
//
//  Created by Maksim Vaselkov on 24.02.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var scrollView = UIScrollView()
    private lazy var image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Avatar"

        scrollView.backgroundColor = .systemGray6
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = .gray

        navigationController?.navigationBar.prefersLargeTitles = true

        setupUI()
    }

    private func setupUI() {
        view.addSubview(scrollView)
    }

    override func viewWillLayoutSubviews() {
        scrollView.frame = view.bounds
        scrollView.contentSize = .init(width: view.frame.width, height: 2000)

        if let navigationBar = navigationController?.navigationBar,
           let largeTitleView = navigationBar.subviews.first(where: { NSStringFromClass($0.classForCoder).contains("UINavigationBarLargeTitleView")}),
           let label = largeTitleView.subviews.first(where: { $0 is UILabel })
        {
            largeTitleView.addSubview(image)
            image.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                image.heightAnchor.constraint(equalToConstant: 36),
                image.widthAnchor.constraint(equalToConstant: 36),
                image.centerYAnchor.constraint(equalTo: label.centerYAnchor),
                image.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -10)
            ])
        }
    }
}
