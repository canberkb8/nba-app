//
//  NbaTeamListResponse.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import Foundation

struct NbaTeamListResponse : Codable {
    let teamData : [TeamData]?

    enum CodingKeys: String, CodingKey {

        case teamData = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teamData = try values.decodeIfPresent([TeamData].self, forKey: .teamData)
    }

}

struct TeamData : Codable {
    let id : Int?
    let abbreviation : String?
    let city : String?
    let conference : String?
    let division : String?
    let full_name : String?
    let name : String?
    let team_logo : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case abbreviation = "abbreviation"
        case city = "city"
        case conference = "conference"
        case division = "division"
        case full_name = "full_name"
        case name = "name"
        case team_logo = "team_logo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        abbreviation = try values.decodeIfPresent(String.self, forKey: .abbreviation)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        conference = try values.decodeIfPresent(String.self, forKey: .conference)
        division = try values.decodeIfPresent(String.self, forKey: .division)
        full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        team_logo = try values.decodeIfPresent(String.self, forKey: .team_logo)
    }

}

